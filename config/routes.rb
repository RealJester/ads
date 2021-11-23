Rails.application.routes.draw do
  devise_for :users
  get 'personal' => 'advertisments#selection'
  
  devise_scope :user do 
    get 'users'  => 'users#index'
    get 'user'   => 'users#show'
  end
  
  resources :advertisments
  root 'static_pages#home'
  get 'help'     => 'static_pages#help'
  get 'about'    => 'static_pages#about'
  get 'contact'  => 'static_pages#contact'
end
