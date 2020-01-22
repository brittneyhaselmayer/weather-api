Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
    resources :weathers
    resources :favourite_locations
    resources :users
    end
  end
end
