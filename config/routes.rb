Rails.application.routes.draw do

  resources :expenses

  get '/balance_details/:id', :to  => 'main#balance_details'
  get '/auto_complete_for_purchase_entered_by', :to => 'main#auto_complete_for_purchase_entered_by'
  get '/auto_complete_for_purchase_description', :to => 'main#auto_complete_for_purchase_description'
  post '/', :to => 'main#new_purchase'
  delete '/delete_purchase/:id', :to => 'main#delete_purchase'

  root "main#index"
end
