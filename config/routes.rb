KreatioBook::Application.routes.draw do

  #get "books/new"
  match "/new" => "books#new", via: :get
  
  
  #get "books/about"
  match "/about" => "books#about", via: :get
  
  #get "books/boks"
  match "/books" => "books#books", via: :get  
  
  #get "books/category"
   match "/category" => "books#category", via: :get
   
  #get "books/uploadbook"
   match "/uploadbook" => "books#uploadbook", via: :get
   
  #get "books/contact"
   match "/contact" => "books#contact", via: :get

  get "books/find"

  
  post "books/create"
  post "upload/uploadFile"
  post "books/check_exist"
  post "books/download_book"

  root :to => "books#new"


  get "log_in" => "sessions#new", :as => "log_in"
  
  get "log_out" => "sessions#destroy", :as => "log_out"

  get "sign_up" => "users#login", :as => "sign_up"
  #root :to => "users#login"
  resources :users
  resources :sessions







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
