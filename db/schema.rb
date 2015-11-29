# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151125011846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.datetime "purchased_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.integer  "user_id",                                         null: false
    t.string   "nome_completo",       limit: 250,                 null: false
    t.string   "endereco_toronto",    limit: 300,                 null: false
    t.date     "data_chegada",                                    null: false
    t.datetime "data_hora_voo",                                   null: false
    t.string   "numero_voo",          limit: 100,                 null: false
    t.integer  "tempo_permanencia",                               null: false
    t.date     "data_nascimento",                                 null: false
    t.string   "nome_escola",         limit: 300
    t.text     "obs"
    t.boolean  "ativo",                           default: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "concordo_termos_uso",             default: true,  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itens_carts", force: :cascade do |t|
    t.integer  "produto_id", null: false
    t.integer  "cart_id",    null: false
    t.decimal  "preco",      null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_notifications", force: :cascade do |t|
    t.text     "params"
    t.integer  "cart_id",        null: false
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 40
    t.string   "content",    limit: 10000
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image"
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "nome",       limit: 40
    t.text     "descricao"
    t.decimal  "price"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 250, default: "",    null: false
    t.string   "encrypted_password",                 default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                              default: false
    t.string   "username",               limit: 70
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
