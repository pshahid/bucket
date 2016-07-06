Rails.application.routes.draw do
  post 'messages', to: 'messages#receive'
  post 'groupme', to: 'group_me#receive'
end
