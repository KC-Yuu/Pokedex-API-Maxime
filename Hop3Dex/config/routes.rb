Rails.application.routes.draw do
  resources :pokemons do
    collection do
      get 'export', to: 'pokemons#export'
    end
  end
  root 'pokemons#index'
end
