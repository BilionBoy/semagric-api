module Api
  module V1
    class EExpositoresController < ApplicationController
      skip_before_action :authenticate_user!
      before_action :set_e_expositor, only: [ :show, :update, :destroy, :update_password ]

      def index
        render json: EExpositor.all
      end

      def show
        render json: @e_expositor
      end

      def create
        expositor = EExpositor.new(e_expositor_params)

        if expositor.save
          render json: {
            status: "success",
            message: "Expositor cadastrado com sucesso",
            data: expositor
          }, status: :created
        else
          render json: {
            status: "error",
            message: "Falha ao cadastrar expositor",
            errors: expositor.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      def update
        if @e_expositor.update(e_expositor_params)
          render json: {
            status: "success",
            message: "Expositor atualizado",
            data: @e_expositor
          }
        else
          render json: {
            status: "error",
            errors: @e_expositor.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      def destroy
        @e_expositor.destroy
        render json: { status: "success", message: "Registro removido" }
      end

      def update_password
        if @e_expositor.update(password: params[:password])
          render json: { status: "success", message: "Senha atualizada" }
        else
          render json: {
            status: "error",
            errors: @e_expositor.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      private

      def set_e_expositor
        @e_expositor = EExpositor.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Registro não encontrado" }, status: :not_found
      end

      def e_expositor_params
        data = params[:e_expositor] || params

        data.permit(
          :e_evento_id,
          :e_tipo_expositor_id,
          :e_segmento_id,
          :status,
          :empresa,
          :cnpj,
          :nome_completo,
          :cpf,
          :responsavel,
          :email_contato,
          :telefone_contato,
          :cidade,
          :estado,
          :stand,
          :password,
          :password_confirmation
        )
      end
    end
  end
end
