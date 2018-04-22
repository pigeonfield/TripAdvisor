Rails.application.routes.draw do
  devise_for :redactors
    resources :destinations
    root 'destinations#index'
end
