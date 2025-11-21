module Api
  module V1
    class ExpositorAuthController < ApplicationController
      skip_before_action :authenticate_user!

      def login
        expositor = EExpositor.find_by(email_contato: params[:email])

        if expositor&.authenticate(params[:password])
          render json: {
            status: "success",
            data: {
              token: SecureRandom.hex(20),
              expositor: expositor
            }
          }
        else
          render json: {
            status: "error",
            message: "Credenciais inválidas"
          }, status: :unauthorized
        end
      end
    end
  end
end
