# frozen_string_literal: true

class CreateEEventos < ActiveRecord::Migration[6.0]
  def up
    unless table_exists?(:e_eventos)
     create_table :e_eventos do |t|
        t.string :nome
        t.integer :ano
        t.date    :data_inicio
        t.date    :data_fim
        t.timestamps
     end
    end
  end

  def down
    drop_table :e_eventos if table_exists?(:e_eventos)
  end
end
