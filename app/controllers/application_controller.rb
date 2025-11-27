class ApplicationController < ActionController::API
  include JsonWebToken
  include JsonResponse

  # ✅ AGORA protege tudo, EXCETO rotas públicas
  before_action :authenticate_user!, unless: :public_route?

  def authenticate_user!
    header = request.headers["Authorization"]
    token = header&.split&.last

    unless token
      render json: { error: "Token ausente" }, status: :unauthorized
      return
    end

    decoded = jwt_decode(token)
    unless decoded
      render json: { error: "Token inválido" }, status: :unauthorized
      return
    end

    if decoded[:user_id] && User.exists?(decoded[:user_id])
      @current_user = User.find(decoded[:user_id])
      return
    end

    if decoded[:expositor_id] && EExpositor.exists?(decoded[:expositor_id])
      @current_expositor = EExpositor.find(decoded[:expositor_id])
      return
    end

    render json: { error: "Não autorizado" }, status: :unauthorized
  end

  # ✅ ROTAS QUE NÃO PRECISAM TOKEN
  def public_route?
    return true if auth_controller?
    return true if request.path.start_with?("/api/v1/e_segmentos")
    return true if request.path == "/api/v1/e_expositores" && request.post?
    false
  end

  def auth_controller?
    self.class.name == "Api::V1::AuthController" ||
    self.class.name == "Api::V1::ExpositorAuthController"
  end

  def current_user
    @current_user
  end

  def current_expositor
    @current_expositor
  end
end
