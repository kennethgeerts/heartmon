Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'dashboard#splash'
  get '/:code', to: 'dashboard#show'
end
