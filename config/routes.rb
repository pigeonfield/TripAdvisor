Rails.application.routes.draw do
  devise_for :redactors
    resources :destinations do
      resources :ratings
    end  
    root 'destinations#index'
end
