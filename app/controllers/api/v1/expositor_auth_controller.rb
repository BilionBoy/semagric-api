module Api
  module V1
    class ExpositorAuthController < ApplicationController
      skip_before_action :authenticate_user!

      def login
        expositor = EExpositor.find_by(email_contato: params[:email])

        return render json: { error: "Expositor não encontrado" }, status: :unauthorized if expositor.nil?

        if expositor.authenticate(params[:password])

          # ✅ JWT PARA EXPOSITOR
          token = jwt_encode(expositor_id: expositor.id)

          render json: {
            status: "success",
            data: {
              token: token,
              expositor: expositor
            }
          }, status: :ok
        else
          render json: { error: "Senha inválida" }, status: :unauthorized
        end
      end
    end
  end
end
