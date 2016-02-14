Rails.application.routes.draw do

  resources :items
  resources :monsters
  get 'maps/show'

  resources :game_boards do
    resource :portals, only: [ :show ]
    resource :in_the_news, only: [ :show ]
    resource :game_board_logs, only: [ :show ]
    resources :investigators do
      resource :game_action_logs, only: [:show ]
      resource :investigator_actions, only: [:show ]
      get :movement_selection
      post :move_start
      get :investigate
      get :ask_people
      get :find_portal
      get :close_portal
      get :combat_monster
      post :set_destination
      get :follow_path
    end
    get :next_turn
    get :start_game
  end

  get 'start_admin' => 'admin#start_admin'
  get 'stop_admin' => 'admin#stop_admin'
  get 'new_investigator_name/:gender' => 'investigators#new_name'

  resources :travels do
    get :wayback
  end
  resources :places
  resources :professions

  root 'game_boards#index'

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
