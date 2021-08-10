Rails.application.routes.draw do
  resource :signup, only: %i[create]
  resources :authentications, only: %i[create]
  resources :users, only: %i[index]
  put "/users/archive", constraints: { format: "json" }
end
