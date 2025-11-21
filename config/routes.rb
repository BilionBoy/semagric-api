Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # ADMIN
      post "auth/login", to: "auth#login"

      # EXPOSITOR (login)
      post "expositor/login", to: "expositor_auth#login"

      # MODELS
      resources :users
      resources :a_tipo_usuarios
      resources :e_eventos
      resources :e_tipo_expositores
      resources :e_segmentos
      resources :e_negociacoes
      resources :e_clientes

      # EXPOSITORES + PATCH DE SENHA
      resources :e_expositores do
        patch :password, action: :update_password, on: :member
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
