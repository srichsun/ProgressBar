Rails.application.routes.draw do
  root to: 'products#index'

  get 'admin/log_in', to: 'admin#log_in'
  post 'admin/log_in', to: 'admin#create_session'
  get 'admin/log_out', to: 'admin#log_out'

  resources :categories do
    member do
      resources :subcategories do
        member do
          get :products
        end
      end
    end
  end
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
