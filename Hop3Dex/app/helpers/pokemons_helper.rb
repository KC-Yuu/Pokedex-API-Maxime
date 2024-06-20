module PokemonsHelper
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

  def gradient_background_for_types(types)
    primary_color = color_for_type(types.first[:name])
    secondary_color = types.second ? color_for_type(types.second[:name]) : primary_color

    "background: linear-gradient(to right, #{primary_color}, #{secondary_color});"
  end
end
