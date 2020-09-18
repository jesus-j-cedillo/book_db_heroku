Rails.application.routes.draw do

  root 'books#index'
  
  resources :books do
    member do
      get :delete
    end
  end
  
  get 'test_controller/index'

  get 'test_controller/add_action'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
