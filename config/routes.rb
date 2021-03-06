Rails.application.routes.draw do

  resources :cart
  resources :itens_cart

  get 'limpar', :controller => 'itens_cart', :action => 'limpar'

  get 'current_cart', :controller => 'carts', :action => 'show', :id => 'current'

  resources :clientes

  # Overriding the Devise method to add the username and be able to persist 
  devise_for :users, :controllers => { registrations: 'registrations' } 
  #Creating the rout to add a comment in a post
  resources :posts do
    post "comments",to: "comments#create"
  end

  resources :produtos
  post 'payment_notifications', :controller => 'payment_notification', :action => 'create'

  #Route to delete a comment
  delete "comments/:id",to: "comments#destroy", as: :comment

  #Root page with all posts
  root 'pages#welcome'

  get 'about' => 'pages#about'

  get 'como_funciona' => 'pages#como_funciona'

  get 'blog' => 'pages#blog'

  get 'servicos' => 'pages#servicos'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
