require 'sidekiq/web'


Rails.application.routes.draw do
  
  mount Sidekiq::Web => '/sidekiq'

  get 'admin_panel/index'
  get 'universities/wishlist'
  get 'discipline_universities/wishlist'
  post 'cities/export'
  post 'discipline_universities/export'
  post 'disciplines/export'
  post 'subdisciplines/export'
  post 'universities/export'
  post 'ngos/export'
  # get 'notification/index'
  get 'notification' => 'notification#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'admin_panel/del_post'
  get 'admin_panel/make_mod/:id', :controller => "admin_panel", :action => "make_mod"
  get 'admin_panel/remove_mod/:id', :controller => "admin_panel", :action => "remove_mod"
  get 'flagged_posts/flag_this/:id' , :controller => "flagged_posts", :action => "flag_this"


  resources :disciplines do
    collection { post :import }
  end
  
  resources :forums, :except =>[:show] do 
    resources :posts do
    member do
      put "like" => "posts#upvote"
      get "like" => "posts#upvote"
      put "dislike" => "posts#downvote"
      get "dislike" => "posts#downvote"
      put "count" => "posts#count"
    end
    # get "posts/tags" => "posts#tags", :as => :tags
      resources :comments,:except =>[:index,:show,:new] do
        member do
          put "like" => "comments#upvote"
          get "like" => "comments#upvote"
          put "dislike" => "comments#downvote"
          get "dislike" => "comments#downvote"
          put "count" => "comments#count"
        end
      end
      
      
    end
  end
  
  resources :comments,:except => [:index,:create,:new] do
    resources :comments
  end

  Rails.application.routes.draw do
  get 'flagged_posts/new'

  get 'flagged_posts/create'

  get 'flagged_posts/index'

  get 'flagged_posts/delete'

  get 'flagged_posts/destroy'

  get 'interested_users/index'

  get 'interested_users/create'

  get 'interested_users/new'

  get 'interested_users/destroy'

  get 'interested_users/delete'

  get 'interested_users/edit'

  get 'interested_users/update'

  get 'interested_users/show'

  get 'admin_panel/index'

    devise_for :users, controllers: {
      registrations: 'users/registrations',
      :omniauth_callbacks => "users/omniauth_callbacks"
      # passwords: 'users/passwords'
    }
  end
  root to: "home#index"
  resources :subdisciplines do
    collection { post :import }
  end
  resources :discipline_universities do
    get :autocomplete_university_name, :on => :collection
    
    collection { post :import }
  end
  
  resources :cities  do
    collection { post :import }
  end
  resources :universities do
    collection { post :import }
  end
  resources :ngos do
    collection { post :import }
  end
  resources :profiles
  resources :education
  resources :profile_education
  resources :tags
  resources :interested_users
  resources :flagged_posts
  get '/suggestions' => 'suggestion#index'
end

