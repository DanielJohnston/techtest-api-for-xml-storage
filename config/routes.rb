Rails.application.routes.draw do
  # resources :images
  namespace :api do
    namespace :v1, defaults: { format: :xml } do
      resources :properties
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
