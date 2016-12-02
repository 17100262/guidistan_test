Rails.application.routes.draw do
  get 'education/index'

  get 'education/show'

  get 'education/create'

  get 'education/new'

  get 'education/edit'

  get 'education/update'

  get 'education/delete'

  get 'education/destroy'

  get 'profile/index'

  get 'profile/show'

  get 'profile/create'

  get 'profile/new'

  get 'profile/edit'

  get 'profile/update'

  get 'profile/delete'

  get 'profile/destroy'

  devise_for :users
  root to: "disciplines#index"
  resources :degreeprograms
  resources :subdisciplines
  resources :discipline_universities
  resources :disciplines
  resources :cities
  resources :universities
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
