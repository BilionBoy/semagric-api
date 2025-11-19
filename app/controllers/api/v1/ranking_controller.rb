module Api
  module V1
    class RankingController < ApplicationController
      def index
        evento_id = params[:evento_id] || EEvento.first.id

        ranking = ENegociacao
          .joins(:e_expositor)
          .where(e_expositores: { e_evento_id: evento_id })
          .select(
            "e_expositores.id AS expositor_id,
             e_expositores.empresa AS empresa,
             e_expositores.nome_completo AS nome,
             SUM(e_negociacoes.valor) AS total_negociado,
             COUNT(e_negociacoes.id) AS qtd_vendas,
             AVG(e_negociacoes.valor) AS ticket_medio"
          )
          .group(
            "e_expositores.id,
             e_expositores.empresa,
             e_expositores.nome_completo"
          )
          .order("total_negociado DESC")

        render json: ranking
      end
    end
  end
end
