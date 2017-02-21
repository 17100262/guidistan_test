Rails.application.routes.draw do

  get 'admin_panel/index'
  post 'cities/export'
  post 'degreeprograms/export'
  post 'discipline_universities/export'
  post 'disciplines/export'
  post 'subdisciplines/export'
  post 'universities/export'
  # get 'notification/index'
  get 'notification' => 'notification#index'


  resources :disciplines
  resources :comments do
    resources :comments
  end
  resources :posts do
    member do
      put "like" => "posts#upvote"
      get "like" => "posts#upvote"
      put "dislike" => "posts#downvote"
      get "dislike" => "posts#downvote"
      put "count" => "posts#count"
    end
      resources :comments do
        member do
          put "like" => "comments#upvote"
          get "like" => "comments#upvote"
          put "dislike" => "comments#downvote"
          get "dislike" => "comments#downvote"
          put "count" => "comments#count"
        end
      end
      
    end
  resources :forums
  # devise_for :users
  
  Rails.application.routes.draw do
  get 'admin_panel/index'

    devise_for :users, controllers: {
      registrations: 'users/registrations',
      :omniauth_callbacks => "users/omniauth_callbacks"
    }
  end
  root to: "disciplines#index"
  resources :degreeprograms
  resources :subdisciplines
  resources :discipline_universities
  
  resources :cities
  resources :universities
  resources :profiles
  resources :education
  resources :profile_education
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
