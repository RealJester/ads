Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do 
    get 'users' => 'users#index'
  end
  
  resources :advertisments
  root 'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
end
