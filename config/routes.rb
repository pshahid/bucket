Rails.application.routes.draw do
  post 'messages', to: 'messages#receive'
  get 'messages', to: 'messages#health'
end

Rails.application.routes.draw do
  get 'healthz', to: 'healthz#receive'
end