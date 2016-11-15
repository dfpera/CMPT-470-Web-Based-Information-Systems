Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :accounts do
    resources :notes do
      resources :tags
    end
  end
end
