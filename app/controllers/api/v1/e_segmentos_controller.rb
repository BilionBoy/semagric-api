# frozen_string_literal: true

module Api
  module V1
    class ESegmentosController < ApplicationController
      skip_before_action :authenticate_user!
      before_action :set_e_segmento, only: [ :show, :update, :destroy ]

      def index
        @e_segmentos = ESegmento.all
        render json: @e_segmentos
      end

      def show
        render json: @e_segmento
      end

      def create
        @e_segmento = ESegmento.new(e_segmento_params)

        if @e_segmento.save
          render json: @e_segmento, status: :created
        else
          render json: {
            status: "error",
            errors: @e_segmento.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      def update
        if @e_segmento.update(e_segmento_params)
          render json: @e_segmento
        else
          render json: {
            status: "error",
            errors: @e_segmento.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      def destroy
        @e_segmento.destroy
        render json: {
          status: "success",
          message: "Segmento removido com sucesso"
        }, status: :ok
      end

      private

      def set_e_segmento
        @e_segmento = ESegmento.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def e_segmento_params
        params.require(:e_segmento).permit(:descricao)
      end
    end
  end
end
