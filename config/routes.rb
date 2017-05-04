Rails.application.routes.draw do

  devise_for :users

  resources :jobs do
    member do
      post :join
      post :quit
    end
    collection do
      get :search
      get :city
      get :category
    end
    resources :resumes
  end

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
    end
  end
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
