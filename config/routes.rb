Rails.application.routes.draw do
  namespace :api do
    namespace :data do
      resources :users
      resources :facts
    end
  end
end
