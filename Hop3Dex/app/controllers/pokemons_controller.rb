require 'csv'
require 'httparty'

class PokemonsController < ApplicationController
  # On stocke les données des pokémons dans une variable d'instance pour les afficher dans la vue
  # Si un paramètre de recherche est présent, on filtre les pokémons en fonction de ce paramètre
  # Sinon on affiche tous les pokémons
  def index
    session[:selected_pokemons] ||= []
    if params[:query].present?
      query = params[:query].downcase
      @pokemons = fetch_pokemons.select { |pokemon| pokemon.dig(:name, :fr).downcase.include?(query) }
    else
      @pokemons = fetch_pokemons
    end
    @selected_pokemons = session[:selected_pokemons]
  end

  # Cette méthode permet d'exporter les données des pokémons sélectionnés dans un fichier CSV
  def export
    if params[:pokemon_ids].present?
      selected_ids = params[:pokemon_ids].map(&:to_i)
      @pokemons = fetch_pokemons.select { |pokemon| selected_ids.include?(pokemon[:pokedex_id]) }
      csv_data = generate_csv(@pokemons)

      respond_to do |format|
        format.csv { send_data csv_data, filename: "pokemons-#{Date.today}.csv", type: 'text/csv' }
      end
    else
      redirect_to pokemons_path, alert: "Veuillez sélectionner au moins un Pokémon pour l'exportation."
    end
  end

  private

  # On récupère les données des pokémons depuis l'API Tyradex
  def fetch_pokemons
    response = HTTParty.get('https://tyradex.vercel.app/api/v1/gen/1')
    JSON.parse(response.body, symbolize_names: true)
  end

  # Permet de générer la structure du fichier CSV à partir des données des pokémons sélectionnés
  def generate_csv(pokemons)
    CSV.generate(headers: true, col_sep: ';') do |csv|
      csv << ['Pokedex ID', 'Name', 'Sprite Regular', 'Sprite Shiny', 'Types', 'Evolution IDs']
      pokemons.each do |pokemon|
        csv << [
          pokemon[:pokedex_id],
          pokemon.dig(:name, :fr),
          pokemon.dig(:sprites, :regular),
          pokemon.dig(:sprites, :shiny),
          (pokemon[:types] || []).map { |type| type[:name] }.join(','),
          (pokemon.dig(:evolution, :next) || []).map { |evo| evo[:pokedex_id] }.join(',')
        ]
      end
    end
  end

  # Méthode permettant de rechercher un Pokémon par son nom
  def search
    @pokemons = Pokemon.where('name LIKE ?', "%#{params[:query]}%")
    render :index
  end
end
