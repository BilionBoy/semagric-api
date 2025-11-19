# frozen_string_literal: true

module Api
  module V1
    class ENegociacaosController < ApplicationController
      before_action :set_e_negociacao, only: [ :show, :update, :destroy ]

      def index
        @e_negociacoes = ENegociacao.all
        render json: @e_negociacoes
      end

      def show
        render json: @e_negociacao
      end

      def create
        @e_negociacao = ENegociacao.new(e_negociacao_params)
        if @e_negociacao.save
          render json: @e_negociacao, status: :created
        else
          render json: @e_negociacao.errors, status: :unprocessable_entity
        end
      end

      def update
        if @e_negociacao.update(e_negociacao_params)
          render json: @e_negociacao
        else
          render json: @e_negociacao.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @e_negociacao.destroy
        head :no_content
      end

      private

      def set_e_negociacao
        @e_negociacao = ENegociacao.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def e_negociacao_params
        params.require(:e_negociacao).permit(:e_expositor_id, :e_cliente_id, :item, :quantidade, :valor, :data_hora, :status)
      end
    end
  end
end
