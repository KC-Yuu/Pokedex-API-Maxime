Rails.application.routes.draw do
  resources :pokemons do
    collection do
      get 'export', to: 'pokemons#export'
    end
  end
  root 'pokemons#index'

  get 'search', to: 'pokemons#search'
end
