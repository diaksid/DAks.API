Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  root to: 'application#fallback_html'

  # Devise + ActiveAdmin
  devise_for :users, ActiveAdmin::Devise.config
  # Active Admin
  ActiveAdmin.routes self

  # API
  namespace :v1,
            defaults: {format: :json},
            constraints: lambda {|request| request.xhr?} do
    namespace :auth do
      post 'login'
      post 'logout'
      get 'user'
    end

    put '/contact', to: 'contact#deliver'

    resources :users, only: [:index, :show]
  end

  # Fallback HTML
  get '*path', to: 'application#fallback_html',
      constraints: lambda {|request| !request.xhr? && request.format.html?}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
