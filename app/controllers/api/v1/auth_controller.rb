module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate_user!

      def login
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
          token = jwt_encode(user_id: user.id)

          render_success(
            message: "Login realizado com sucesso",
            data: {
              token: token,
              user: user
            }
          )
        else
          render_error(
            message: "Email ou senha inválidos",
            status: :unauthorized
          )
        end
      end
    end
  end
end
