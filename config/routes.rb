Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users, :except => [:edit] do
    resources :pictures, :except => [:edit] do
      resources :associations, :only => [:new, :create]
    end
  end

  resources :pictures, :except => [:edit] do
    resources :tags
    resources :associations, :except => [:show, :index]

  end
  root to: "users#index"
end
