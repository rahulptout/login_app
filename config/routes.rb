Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, path: 'user', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' } , :controllers  => {
             :registrations => 'my_devise/registrations',
            
           }
  
  resources :books 
   


  # get '/admin/:id', to: 'admin#edit', as: 'admin'
  resources :admin, only: [:edit ,:update]

  resources :home
  # devise_for :views
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
