# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_11_19_181922) do
  create_table "a_tipo_usuarios", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "e_clientes", force: :cascade do |t|
    t.integer "e_expositor_id", null: false
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.text "endereco"
    t.string "interesse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_expositor_id"], name: "index_e_clientes_on_e_expositor_id"
  end

  create_table "e_eventos", force: :cascade do |t|
    t.string "nome"
    t.integer "ano"
    t.date "data_inicio"
    t.date "data_fim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "e_expositores", force: :cascade do |t|
    t.integer "e_evento_id", null: false
    t.integer "e_tipo_expositor_id", null: false
    t.integer "e_segmento_id", null: false
    t.string "status"
    t.string "empresa"
    t.string "cnpj"
    t.string "nome_completo"
    t.string "cpf"
    t.string "responsavel"
    t.string "email_contato"
    t.string "telefone_contato"
    t.string "cidade"
    t.string "estado"
    t.string "stand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_evento_id"], name: "index_e_expositores_on_e_evento_id"
    t.index ["e_segmento_id"], name: "index_e_expositores_on_e_segmento_id"
    t.index ["e_tipo_expositor_id"], name: "index_e_expositores_on_e_tipo_expositor_id"
  end

  create_table "e_negociacoes", force: :cascade do |t|
    t.integer "e_expositor_id", null: false
    t.integer "e_cliente_id", null: false
    t.string "item"
    t.integer "quantidade"
    t.decimal "valor"
    t.datetime "data_hora"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_cliente_id"], name: "index_e_negociacoes_on_e_cliente_id"
    t.index ["e_expositor_id"], name: "index_e_negociacoes_on_e_expositor_id"
  end

  create_table "e_segmentos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "e_tipo_expositores", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "e_clientes", "e_expositores"
  add_foreign_key "e_expositores", "e_eventos"
  add_foreign_key "e_expositores", "e_segmentos"
  add_foreign_key "e_expositores", "e_tipo_expositores"
  add_foreign_key "e_negociacoes", "e_clientes"
  add_foreign_key "e_negociacoes", "e_expositores"
end
