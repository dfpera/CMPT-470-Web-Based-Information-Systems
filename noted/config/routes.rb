Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :accounts do
  #   post  '/tags' => 'notes#createnewtag', :as => :create_new_tag
  #   get  '/tags' => 'notes#newtag', :as => :new_tag
  #   resources :notes
  #   resources :tags
  # end
  # resources :sessions
  root 'accounts#index'
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # get '/logout', to: 'sessions#destroy'

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
    end
  end
end
