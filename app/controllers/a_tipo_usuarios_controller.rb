class ATipoUsuariosController < ApplicationController
  before_action :set_a_tipo_usuario, only: %i[ show update destroy ]

  # GET /a_tipo_usuarios
  def index
    @a_tipo_usuarios = ATipoUsuario.all
    render json: @a_tipo_usuarios
  end

  # GET /a_tipo_usuarios/1
  def show
    render json: @a_tipo_usuario
  end

  # POST /a_tipo_usuarios
  def create
    @a_tipo_usuario = ATipoUsuario.new(a_tipo_usuario_params)

    if @a_tipo_usuario.save
      render json: @a_tipo_usuario, status: :created, location: @a_tipo_usuario
    else
      render json: @a_tipo_usuario.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /a_tipo_usuarios/1
  def update
    if @a_tipo_usuario.update(a_tipo_usuario_params)
      render json: @a_tipo_usuario
    else
      render json: @a_tipo_usuario.errors, status: :unprocessable_content
    end
  end

  # DELETE /a_tipo_usuarios/1
  def destroy
    @a_tipo_usuario.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_a_tipo_usuario
      @a_tipo_usuario = ATipoUsuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def a_tipo_usuario_params
      params.require(:a_tipo_usuario).permit(:descricao)
    end
end
