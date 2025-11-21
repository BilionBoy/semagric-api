# frozen_string_literal: true

module Api
  module V1
    class ETipoExpositoresController < ApplicationController
      before_action :set_e_tipo_expositor, only: [ :show, :update, :destroy ]

      def index
        @e_tipo_expositores = ETipoExpositor.all
        render json: @e_tipo_expositores
      end

      def show
        render json: @e_tipo_expositor
      end

      def create
        @e_tipo_expositor = ETipoExpositor.new(e_tipo_expositor_params)
        if @e_tipo_expositor.save
          render json: @e_tipo_expositor, status: :created
        else
          render json: @e_tipo_expositor.errors, status: :unprocessable_entity
        end
      end

      def update
        if @e_tipo_expositor.update(e_tipo_expositor_params)
          render json: @e_tipo_expositor
        else
          render json: @e_tipo_expositor.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @e_tipo_expositor.destroy
        head :no_content
      end

      private

      def set_e_tipo_expositor
        @e_tipo_expositor = ETipoExpositor.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def e_tipo_expositor_params
        params.require(:e_tipo_expositor).permit(:descricao)
      end
    end
  end
end
