Rails.application.routes.draw do
  resources :realms, only: [:index] do
    member do
      patch 'subscribe'
      patch 'unsubscribe'
    end
  end
end
