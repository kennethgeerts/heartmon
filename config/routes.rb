Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  root to: 'dashboard#splash'
  get '/:code/teams', to: 'dashboard#teams', as: 'teams'
  get '/:code', to: 'dashboard#show'
end
