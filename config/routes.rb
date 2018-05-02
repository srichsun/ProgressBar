Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/srichsun_admin', as: 'rails_admin'
  root to: 'products#index'

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
