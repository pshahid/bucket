Rails.application.routes.draw do
  post 'messages', to: 'messages#receive'
end

Rails.application.routes.draw do
  get 'healthz'
end