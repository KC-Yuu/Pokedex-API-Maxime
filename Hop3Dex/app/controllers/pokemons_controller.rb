require 'csv'
require 'httparty'

class PokemonsController < ApplicationController
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

  def show
    @pokemon = fetch_pokemon(params[:id])
  end

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

  def fetch_pokemons
    response = HTTParty.get('https://tyradex.vercel.app/api/v1/pokemon')
    all_pokemons = JSON.parse(response.body, symbolize_names: true)
    all_pokemons.select { |pokemon| pokemon[:generation] == 1 }
  end

  def fetch_pokemon(id)
    response = HTTParty.get("https://tyradex.vercel.app/api/v1/pokemon/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

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

  def search
    @pokemons = Pokemon.where('name LIKE ?', "%#{params[:query]}%")
    render :index
  end
end

