require 'csv'
require 'httparty'

class PokemonsController < ApplicationController

  # Méthode pour récupérer la liste des Pokémon de la première génération et les stocker dans une variable d'instance.
  def index
    session[:selected_pokemons] ||= []

    @pokemons = fetch_pokemons
    @pokemon_types = fetch_pokemon_types

    if params[:generation].blank?
      params[:generation] = "1"
    end

    if params[:generation] != "all"
      generation = params[:generation].to_i
      @pokemons = @pokemons.select { |pokemon| pokemon[:generation] == generation }
    end

    if params[:query].present?
      query = params[:query].downcase
      @pokemons = @pokemons.select { |pokemon| pokemon.dig(:name, :fr).downcase.include?(query) }
    end

    if params[:type].present?
      type = params[:type].downcase
      @pokemons = @pokemons.select { |pokemon| pokemon[:types] && pokemon[:types].any? { |t| t[:name].downcase == type } }
    end

    if params[:sort_order].present? && ['asc', 'desc'].include?(params[:sort_order])
      if params[:sort_order] == 'asc'
        @pokemons = @pokemons.sort_by { |pokemon| pokemon[:pokedex_id] }
      else
        @pokemons = @pokemons.sort_by { |pokemon| pokemon[:pokedex_id] }.reverse
      end
    end

    if params[:pokedex_id].present?
      pokedex_id = params[:pokedex_id].to_i
      @pokemons = @pokemons.select { |pokemon| pokemon[:pokedex_id] == pokedex_id }
    end

    @selected_pokemons = session[:selected_pokemons]
  end

  # Cette méthode permet de récupérer les informations d'un Pokémon en fonction de son ID et de les stocker dans une variable d'instance.
  def show
    @pokemon = fetch_pokemon(params[:id])
    @pokemon_types = fetch_pokemon_types
  end

  # Cette méthode permet d'ajouter un Pokémon à la liste des Pokémon sélectionnés.
  def export
    if params[:pokemon_ids].present?
      selected_ids = params[:pokemon_ids].split(',').map(&:to_i)
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

  # Méthode pour récupérer la liste des Pokémon de toutes les générations.
  def fetch_pokemons
    response = HTTParty.get('https://tyradex.vercel.app/api/v1/pokemon')
    JSON.parse(response.body, symbolize_names: true)
  end


  # Méthode pour récupérer les informations d'un Pokémon en fonction de son ID.
  def fetch_pokemon(id)
    response = HTTParty.get("https://tyradex.vercel.app/api/v1/pokemon/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  # Méthode pour récupérer la liste des types de Pokémon.
  def fetch_pokemon_types
    pokemons = fetch_pokemons
    types = pokemons.map { |pokemon| pokemon[:types] }.flatten.compact.uniq
    types.map { |type| type[:name] }.sort
  end

  # Méthode pour générer un fichier CSV à partir des informations des Pokémon sélectionnés.
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

  # Méthode pour rechercher un Pokémon en fonction de son nom.
  def search
    @pokemons = Pokemon.where('name LIKE ?', "%#{params[:query]}%")
    render :index
  end

  # Méthode pour filtrer les Pokémon en fonction des paramètres de recherche.
  def filter_pokemons(pokemons)
    pokemons = pokemons.where(type: params[:type]) if params[:type].present?
    pokemons = pokemons.where(pokedex_id: params[:pokedex_id]) if params[:pokedex_id].present?
    pokemons
  end
end