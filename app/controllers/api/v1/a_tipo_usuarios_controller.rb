# frozen_string_literal: true

module Api
  module V1
    class ATipoUsuariosController < ApplicationController
      before_action :set_a_tipo_usuario, only: [:show, :update, :destroy]

      def index
        @a_tipo_usuarios = ATipoUsuario.all
        render json: @a_tipo_usuarios
      end

      def show
        render json: @a_tipo_usuario
      end

      def create
        @a_tipo_usuario = ATipoUsuario.new(a_tipo_usuario_params)
        if @a_tipo_usuario.save
          render json: @a_tipo_usuario, status: :created
        else
          render json: @a_tipo_usuario.errors, status: :unprocessable_entity
        end
      end

      def update
        if @a_tipo_usuario.update(a_tipo_usuario_params)
          render json: @a_tipo_usuario
        else
          render json: @a_tipo_usuario.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @a_tipo_usuario.destroy
        head :no_content
      end

      private

      def set_a_tipo_usuario
        @a_tipo_usuario = ATipoUsuario.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def a_tipo_usuario_params
        params.require(:a_tipo_usuario).permit(descricao)
      end
    end
  end
end
