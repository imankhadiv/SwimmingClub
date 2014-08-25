Rails.application.routes.draw do
  resources :swimming_records, except: [:show,:edit,:update] do
    collection { post :import_times }
    collection { get :update_system }
    collection { get :results}
    collection { post :synchronise}
  end

  get 'compare_times/compare'
  get 'compare_times/search'
  get 'compare_times/show'
  get 'compare_times/show_external_times'


  resources :payments

  resources :events

  # get 'calendar/index'

  resources :parents do
    get 'cancel_parent_registration', on: :collection

  end

  resources :calendar, only: :index

  post 'parents/check_relation', as: :check

  resources :swimmer_times, except: [:show] do
    get 'search', on: :collection
    get 'best_times', on: :collection
  end

  resources :swimmers, except: :show do
    get 'swimmer_times', on: :member
    get 'medical_conditions', on: :member
    get 'payment', on: :member
    get 'cancel_swimmer_registration', on: :collection
  end


  # resources :addresses

  get 'users/index'
  get 'users/profile'
  get 'users/view_dbs_status'



  get 'home/welcome', as: :home

  get 'page/awaiting', as: :awaiting

  #get 'home/welcome'
  root 'home#welcome'



  #get 'page/awaiting' => 'page#awaiting', as: :awaiting


  #devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users do
    member {get :edit_dbs_check}
    member {post :update_dbs_check}
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
