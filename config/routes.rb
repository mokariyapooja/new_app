Rails.application.routes.draw do
  devise_for :drivers
  #devise_for :drivers,:controllers => { :registrations => "driver/registrations", :passwords => "driver/passwords",:confirmations => "driver/confirmations",:sessions=> "driver/sessions"}, :skip => [:registrations]
  devise_for :users 
  root  to: 'home#index'
  namespace :api , :defaults => { :format => 'json' } do
    scope :module => :v1 do
      post 'register'          => 'sessions#register',         :as => :register
      post 'login'             => 'sessions#login',            :as => :login
      get  'logout'            => 'sessions#logout',           :as => :logout
      post 'forgot_password'   => 'sessions#forgot_password',  :as => :forgot_password
      post 'change_password'   => 'sessions#change_password',  :as => :change_password
      post 'update_profile'    => 'users#update_profile',      :as => :update_profile
      post 'create_car'        => 'cars#create_car',           :as => :create_car   
      post 'car_list'          => 'cars#car_list',             :as => :car_list
      
    namespace :drivers do
      post 'driver_register'          => 'sessions#driver_register',         :as => :driver_register
      post 'driver_login'             => 'sessions#driver_login',            :as => :driver_login
      get  'driver_logout'            => 'sessions#driver_logout' ,          :as => :driver_logout
      post 'driver_forgot_password'   => 'sessions#driver_forgot_password',  :as => :driver_forgot_password
      post 'driver_change_password'   => 'sessions#driver_change_password',  :as => :driver_change_password
      post 'driver_update_profile'    =>  'drivers#driver_update_profile',   :as => :driver_update_profile
      post 'driver_list'              => 'drivers#driver_list',              :as => :driver_list
    end
   end
  end

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
