Rails.application.routes.draw do
  resources :rsas
  root to: "rsas#new"

# POST /rsas - създава нов ключ и връща id на този ключ
# POST /rsas - създава нов ключ с конкретните стойности за n, e, d. Връзка id-то
#     params: n, e, d
# GET /rsas/:id - връща json представяне на ключа с идентификатор id. JSON-а съдържа три ключа n, e, d със стойности на съответните параметри
# POST /rsas/:id/encrypt_messages/ - криптира съобщението подадено с параметъра и създава ново криптирано съобщение. Връща идентификатор
#     params: message
# GET /rsas/:id/encrypt_messages/:id - връща криптирано съобщение с дадения идентификатор. JSON съдържа един ключ message със стойност съобщението
# POST /rsas/:id/decrypt_messages/ - декриптира съобщението подадено с параметър и създава ново дикриптирано съобщение на база параметъра.
#     params: message
  match '/rsas' => 'rsas#create', via: :post
  match '/rsas/#{:id}' => 'rsas#show', via: :get
  match '/rsas/#{:id}/encrypt_messages/' => 'rsas#encrypt_messages', via: :post
  match '/rsas/#{:id}/encrypt_messages/#{:id}' => 'rsas#show', via: :get
  match '/rsas/#{:id}/decrypt_messages/' => 'rsas#decrypt_messages', via: :post

  # For detail s on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



