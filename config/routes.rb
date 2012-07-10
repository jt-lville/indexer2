Indexer2::Application.routes.draw do
  resources :preferences

  get "home/index"

  resources :posts
  resources :users, :except => [:create]

  devise_for :users, :controllers => {:registrations => 'registrations', :invitations => 'invitations'}, :except => [:show] do
    get "/signup" => "devise/registrations#new", :as => 'user_signup'
    get '/logout' => 'devise/sessions#destroy', :as => 'user_logout'
    get '/login' => "devise/sessions#new", :as => 'user_login'
  end 

  match '/welcome' => 'pages#welcome'

  resources :preferences, :except => [:destory, :edit, :create, :new, :index, :show]  do 
    collection do
      post "make_feed_preference"
      post "change_preference"
    end
  end
  
  root :to => "home#index"

end

