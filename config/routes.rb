Rails.application.routes.draw do

    resources :posts do
      resources :answers, only: [:create, :destroy, :show]
    end

    delete '/answers/:id',  to: 'answers#destroy'

    resources :users do
      collection do
        post :login
      end
    end

    resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
