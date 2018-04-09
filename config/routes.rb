Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  # get '/jobs/:job_id/comments/:id' => 'comments#show'
  # get '/jobs/:job_id/comments/new(.:format)'  => 'comments#new'

  # resources :users
  # resources :jobs

  resources :users do
    resources :jobs
  end

    resources :jobs do
      resources :comments
  end

  # resources :users do
  #   resources :jobs do
  #     resources :comments
  #   end
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
