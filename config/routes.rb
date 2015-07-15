Rails.application.routes.draw do
  get 'sessions/new'

  resources :projects do
    resources :experiments, except: :index do
      resources :procedures, except: [:index, :show] do
        post '/observations', to: 'observations#procedure_create'
        resources :observations, except: [:index, :show, :create] do
          resources :comments, except: [:index, :show, :create]
          post '/comments', to: 'comments#observation_create'
        end
      end
      post '/observations', to: 'observations#experiment_create'
      resources :observations, except: [:index, :show, :create] do
        resources :comments, except: [:index, :show, :create]
          post '/comments', to: 'comments#observation_create'
      end
      resources :comments, except: [:index, :show, :create]
        post '/comments', to: 'comments#experiment_create'
    end
    resources :comments, except: [:index, :show, :create]
      post '/comments', to: 'comments#project_create'
  end

  resources :users

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new' # TEMPORARY

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
