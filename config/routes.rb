Rails.application.routes.draw do
  resources :faqs do
    member do
      get 'move_to_bottom'
      get 'move_to_top'
      get 'move_higher'
      get 'move_lower'
    end
  end

  resources :resources do
    collection do
      get 'web_development'
      get 'scratch'
    end
    member do
      get 'move_to_bottom'
      get 'move_to_top'
      get 'move_higher'
      get 'move_lower'
    end
  end
  resources :venues
  resources :events
  resources :sessions

  root 'home#index'

  get 'home/index'

  get 'set_language/english', as: :set_language_english
  get 'set_language/french', as: :set_language_french

  get 'participants' => 'faqs#participants', as: :participants
  get 'mentors' => 'faqs#mentors', as: :mentors

  get 'contact' => 'home#contact', as: :contact

  get 'sign_in' => 'sessions#new', as: :sign_in
  get 'sign_out' => 'sessions#destroy', as: :sign_out

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
