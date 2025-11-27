module Api
  module V1
    class EClientesController < ApplicationController
      before_action :set_e_cliente, only: [:show, :update, :destroy]

      def index
        if current_expositor
          # expositor autenticado: apenas os clientes do expositor
          render json: ECliente.where(e_expositor_id: current_expositor.id)
        elsif current_user
          # usuário autenticado (admin): retorna todos os clientes
          render json: ECliente.all
        else
          render json: []
        end
      end

      def show
        render json: @e_cliente
      end

      def create
        return render json: { error: "Expositor não logado" }, status: :unauthorized unless current_expositor

        @e_cliente = ECliente.new(e_cliente_params)
        @e_cliente.e_expositor_id = current_expositor.id

        if @e_cliente.save
          render json: @e_cliente, status: :created
        else
          render json: @e_cliente.errors, status: :unprocessable_entity
        end
      end

      def update
        if @e_cliente.update(e_cliente_params)
          render json: @e_cliente
        else
          render json: @e_cliente.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @e_cliente.destroy
        head :no_content
      end

      private

      def set_e_cliente
        @e_cliente = ECliente.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def e_cliente_params
        params.require(:e_cliente).permit(
          :nome, :telefone, :email, :endereco, :interesse, :cidade, :estado
        )
      end
    end
  end
end
