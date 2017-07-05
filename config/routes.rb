Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users do
    resources :pictures do
      resources :associations
    end
  end

  resources :pictures do
    resources :tags
  end
  root to: "users#index"
end
