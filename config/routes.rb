Rails.application.routes.draw do
  get 'home/index'

  get 'home/send_email'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get 'home/email', to: 'home#send_email'
end
