Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/srichsun_admin', as: 'rails_admin'
  root to: 'products#index'

  get 'admin/log_in', to: 'admin#log_in'
  post 'admin/log_in', to: 'admin#create_session'
  get 'admin/log_out', to: 'admin#log_out'


  resources :categories, param: :category_id, only: [] do
    member do
      get :products
      resources :subcategories, param: :subcategory_id, only: [] do
        member do
          get :products
        end
      end
    end
  end

  resources :products
  resources :cart_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
