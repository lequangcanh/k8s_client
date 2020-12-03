Rails.application.routes.draw do
  resources :links, only: %i(show new create)
end
