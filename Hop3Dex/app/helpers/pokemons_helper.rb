module PokemonsHelper
  # Permet de générer un background color en fonction du type du Pokémon.
  def color_for_type(type)
    case type.downcase
    when 'feu'
      '#e62829'
    when 'eau'
      '#4299e1'
    when 'plante'
      '#3fa129'
    when 'électrik'
      '#fac000'
    when 'psy'
      '#ef4179'
    when 'glace'
      '#3fd8ff'
    when 'dragon'
      '#5061e1'
    when 'spectre'
      '#704170'
    when 'fée'
      '#ef71ef'
    when 'insecte'
      '#91a119'
    when 'normal'
      '#9fa19f'
    when 'vol'
      '#81b9ef'
    when 'poison'
      '#8f41cb'
    when 'sol'
      '#915121'
    when 'combat'
      '#ff8000'
    when 'roche'
      '#afa981'
    when 'acier'
      '#60a1b8'
    else
      '#e2e8f0'
    end
  end

  # Permet de prendre en compte les deux types du Pokémon pour générer un background color.
  def gradient_background_for_types(types)
    return 'background: #e2e8f0;' if types.nil? || types.empty?

    primary_color = color_for_type(types.first[:name])
    secondary_color = types.second ? color_for_type(types.second[:name]) : primary_color

    "background: linear-gradient(to right, #{primary_color}, #{secondary_color});"
  end

  # Permet d'attribuer l'icon du type en fonction du nom de la résistance.
  def type_image(type_name)
    type_images = {
      "Normal" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/normal.png",
      "Feu" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/feu.png",
      "Eau" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/eau.png",
      "Électrik" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/electrik.png",
      "Plante" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/plante.png",
      "Glace" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/glace.png",
      "Combat" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/combat.png",
      "Poison" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/poison.png",
      "Sol" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/sol.png",
      "Vol" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/vol.png",
      "Psy" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/psy.png",
      "Insecte" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/insecte.png",
      "Roche" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/roche.png",
      "Spectre" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/spectre.png",
      "Dragon" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/dragon.png",
      "Ténèbres" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/tenebres.png",
      "Acier" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/acier.png",
      "Fée" => "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/fee.png"
    }
    type_images[type_name] || ""
  end

  # Permet de générer l'url du sprite du Pokémon en fonction de son ID et du type de sprite.
  def sprite_url(pokemon_id, type = :regular)
    base_url = "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/sprites"
    case type
    when :regular
      "#{base_url}/#{pokemon_id}/regular.png"
    when :shiny
      "#{base_url}/#{pokemon_id}/shiny.png"
    else
      "#{base_url}/#{pokemon_id}/regular.png"
    end
  end

  def generation_text
    generation_map = {
      "1" => "Première génération",
      "2" => "Deuxième génération",
      "3" => "Troisième génération",
      "4" => "Quatrième génération",
      "5" => "Cinquième génération",
      "6" => "Sixième génération",
      "7" => "Septième génération",
      "8" => "Huitième génération",
      "9" => "Neuvième génération",
      "all" => "Toutes les générations"
    }
    generation_map[params[:generation]] || "Première génération"
  end
end
