module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate_user!

      def login
        user = User.find_by(email: params[:email])

        unless user&.authenticate(params[:password])
          return render_error(message: "Email ou senha inválidos", status: :unauthorized)
        end

        token = jwt_encode(
          user_id: user.id,
          role: "admin",
          email: user.email
        )

        render_success(
          message: "Login realizado com sucesso",
          data: {
            token: token,
            user: user
          }
        )
      end
    end
  end
end
