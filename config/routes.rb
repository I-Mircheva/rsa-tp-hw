Rails.application.routes.draw do
  resources :hidden_notes
  root to: "hidden_notes#new"

  match '/messages/api' => 'hidden_notes#create', via: :post

  # For detail s on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



