Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'genrate_token', to: 'tokens#genrate_token'
  
  get 'get_token', to: 'tokens#get_token'
  patch 'unlock_token', to: 'tokens#unlock_token'
  delete 'delete_token', to: 'tokens#delete_token'

end
