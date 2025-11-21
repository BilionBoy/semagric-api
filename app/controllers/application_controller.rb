class ApplicationController < ActionController::API
  include JsonWebToken
  include JsonResponse
  include ActionController::Cookies

  before_action :authenticate_user!

  def authenticate_user!
    header = request.headers["Authorization"]
    token = header&.split&.last

    decoded = jwt_decode(token)

    # ✅ ADMIN
    if decoded&.[](:user_id) && User.exists?(decoded[:user_id])
      @current_user = User.find(decoded[:user_id])
      return
    end

    # ✅ EXPOSITOR
    if decoded&.[](:expositor_id) && EExpositor.exists?(decoded[:expositor_id])
      @current_expositor = EExpositor.find(decoded[:expositor_id])
      return
    end

    render json: { error: "Não autorizado" }, status: :unauthorized
  end

  def current_user
    @current_user
  end

  def current_expositor
    @current_expositor
  end
end
