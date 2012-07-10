Indexer2::Application.routes.draw do
  resources :preferences

  get "home/index"

  resources :posts
  #resources :users

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
  

   #devise_for :users, :controllers => { :sessions => "users/sessions" }

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

end

