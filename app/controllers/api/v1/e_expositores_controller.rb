# frozen_string_literal: true

module Api
  module V1
    class EExpositorsController < ApplicationController
      before_action :set_e_expositor, only: [ :show, :update, :destroy ]

      def index
        @e_expositores = EExpositor.all
        render json: @e_expositores
      end

      def show
        render json: @e_expositor
      end

      def create
        @e_expositor = EExpositor.new(e_expositor_params)
        if @e_expositor.save
          render json: @e_expositor, status: :created
        else
          render json: @e_expositor.errors, status: :unprocessable_entity
        end
      end

      def update
        if @e_expositor.update(e_expositor_params)
          render json: @e_expositor
        else
          render json: @e_expositor.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @e_expositor.destroy
        head :no_content
      end

      private

      def set_e_expositor
        @e_expositor = EExpositor.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      # 🔥 strong params CORRIGIDOS 100%
      def e_expositor_params
        params.require(:e_expositor).permit(:e_evento_id, :e_tipo_expositor_id, :e_segmento_id, :status, :empresa, :cnpj, :nome_completo, :cpf, :responsavel, :email_contato, :telefone_contato, :cidade, :estado, :stand
        )
      end
    end
  end
end
