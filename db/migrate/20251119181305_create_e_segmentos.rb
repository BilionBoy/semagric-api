# frozen_string_literal: true

class CreateESegmentos < ActiveRecord::Migration[6.0]
  def change
    create_table :e_segmentos do |t|
        t.string :descricao
      t.timestamps
    end
  end
end
