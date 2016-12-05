Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'accounts#index'

  resources :accounts, :only => [:index, :new, :create] do
    collection do
      post :login
      get :logout
    end
  end
  resources :notes do
    collection do
      post :tag, :action => 'createtag'
      get :tag, :action => 'newtag'
      delete :tag, :action => 'destroytag'
      patch :tag, :action => 'pintag', as: 'pin_tag'
    end
  end
end
