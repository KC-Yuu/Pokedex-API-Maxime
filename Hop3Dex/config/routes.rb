Rails.application.routes.draw do
  resources :pokemons, only: [:index, :show] do
    collection do
      get :export, defaults: { format: :csv }
    end
  end

  root "pokemons#index"
end
