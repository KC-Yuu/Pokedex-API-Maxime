module PokemonsHelper
  def background_class_for_type(type)
    case type.downcase
    when 'feu'
      'bg-red-500'
    when 'eau'
      'bg-blue-500'
    when 'plante'
      'bg-green-500'
    when 'électrik'
      'bg-yellow-500'
    when 'psy'
      'bg-purple-500'
    when 'glace'
      'bg-blue-300'
    when 'dragon'
      'bg-indigo-700'
    when 'ténèbres'
      'bg-gray-800'
    when 'fée'
      'bg-pink-400'
    else
      'bg-gray-200'
    end
  end
end
