class ApplicationController < ActionController::API
  include JsonWebToken
  include JsonResponse

  before_action :authenticate_user!

  def authenticate_user!
    header = request.headers["Authorization"]
    token = header.split.last if header.present?

    decoded = jwt_decode(token)

    if decoded && User.exists?(decoded[:user_id])
      @current_user = User.find(decoded[:user_id])
    else
      render json: { error: "Não autorizado" }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end
