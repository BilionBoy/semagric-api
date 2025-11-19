# frozen_string_literal: true

module Api
  module V1
    class EClientesController < ApplicationController
      before_action :set_e_cliente, only: [ :show, :update, :destroy ]

      def index
        @e_clientes = ECliente.all
        render json: @e_clientes
      end

      def show
        render json: @e_cliente
      end

      def create
        @e_cliente = ECliente.new(e_cliente_params)
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
        params.require(:e_cliente).permit(:nome, :telefone, :email, :endereco, :interesse, :e_expositor_id)
      end
    end
  end
end
