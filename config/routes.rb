Rails.application.routes.draw do
  resources :reservations do
    resources :scores
  end
  devise_for :users
  resources :membership_applications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'membership_applications#new'
end
