Rails.application.routes.draw do
  root to: "home#index"
  
  get 'boy', to: "home#boy"
  get 'girl', to: "home#girl"
  get 'friend', to: "home#friend"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
