# frozen_string_literal: true

module Api
  module V1
    class EEventosController < ApplicationController
      before_action :set_e_evento, only: [ :show, :update, :destroy ]

      def index
        @e_eventos = EEvento.all
        render json: @e_eventos
      end

      def show
        render json: @e_evento
      end

      def create
        @e_evento = EEvento.new(e_evento_params)
        if @e_evento.save
          render json: @e_evento, status: :created
        else
          render json: @e_evento.errors, status: :unprocessable_entity
        end
      end

      def update
        if @e_evento.update(e_evento_params)
          render json: @e_evento
        else
          render json: @e_evento.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @e_evento.destroy
        head :no_content
      end

      private

      def set_e_evento
        @e_evento = EEvento.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def e_evento_params
        params.require(:e_evento).permit(:nome, :ano, :data_inicio, :data_fim)
      end
    end
  end
end
