
Rails.application.routes.draw do
  resources :rsa_fulls
  resources :messages
  root to: "rsas#new"

  match '/rsas' => 'rsa_fulls#create', via: :post
  match '/rsas/:id' => 'rsa_fulls#show', via: :get
  match '/rsas/:id/encrypt_messages/' => 'messages#create', via: :post
  match '/rsas/:id/encrypt_messages/:message_id' => 'messages#show', via: :get
  match '/rsas/:id/decrypt_messages/' => 'messages#decrypt', via: :post
  # POST /rsas - създава нов ключ и връща id на този ключ
  # POST /rsas - създава нов ключ с конкретните стойности за n, e, d. Връзка id-то
  #     params: n, e, d
  # GET /rsas/:id - връща json представяне на ключа с идентификатор id. JSON-а съдържа три ключа n, e, d със стойности на съответните параметри
  # POST /rsas/:id/encrypt_messages/ - криптира съобщението подадено с параметъра и създава ново криптирано съобщение. Връща идентификатор
  #     params: message
  # GET /rsas/:id/encrypt_messages/:id - връща криптирано съобщение с дадения идентификатор. JSON съдържа един ключ message със стойност съобщението
  # POST /rsas/:id/decrypt_messages/ - декриптира съобщението подадено с параметър и създава ново дикриптирано съобщение на база параметъра.
  #     params: message

  # For detail s on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# curl -H "Content-Type: application/json" -X POST -d '{"n": 19, "e": 14, "d": 48}' https://rsa-tp-hw.herokuapp.com/rsas

# curl -H "Content-Type: application/json" -X GET https://rsa-tp-hw.herokuapp.com/rsas/1

# curl -H "Content-Type: application/json" -X POST -d '{"message":"Supernatural school"}' https://rsa-tp-hw.herokuapp.com/rsas/1/encrypt_messages/

# curl -H "Content-Type: application/json" -X POST -d '{"message":"155.1881.926.936.2359.1368.362.1075.1881.2359.362.379.1552.761.263.2726.999.999.379"}' https://rsa-tp-hw.herokuapp.com/rsas/1/decrypt_messages/

# curl -H "Content-Type: application/json" -X GET https://rsa-tp-hw.herokuapp.com/rsas/1/encrypt_messages/1

