Rails.application.routes.draw do
  get 'sessions/create'

  get 'welcome/index'

  get 'welcome/app'

  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
      resources :users
      resources :polls, controller: 'my_polls', except: [:new, :edit] do
        resources :questions, except: [:new, :edit]
        resources :answers, only: [:update, :destroy, :create]
      end
      match "*unmatched", via: [:options], to: "api/v1/master_api#xhr_options_request"
    end
  end

  get '/', to: 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'

end
