Rails.application.routes.draw do
  root to: 'dashboard#splash'
  get '/:code', to: 'dashboard#show'
end
