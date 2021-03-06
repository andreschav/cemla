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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140306204421) do

  create_table "artes", :force => true do |t|
    t.string   "invitacion_file"
    t.string   "nombre"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "cargos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ciudades", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "correos", :force => true do |t|
    t.string   "nombre"
    t.string   "login"
    t.string   "pass"
    t.integer  "cantidad_disponible"
    t.integer  "cantidad_enviados"
    t.integer  "cantidad_restantes"
    t.date     "fecha"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "cuentas_correos", :force => true do |t|
    t.string   "correoe"
    t.integer  "persona_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fuentes_laborales", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "correoe"
    t.integer  "fono"
    t.integer  "fax"
    t.string   "web"
    t.integer  "ciudad_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invitaciones", :force => true do |t|
    t.string   "nombre"
    t.string   "asunto"
    t.string   "logo"
    t.text     "cabeza"
    t.text     "cuerpo"
    t.text     "pie"
    t.date     "fecha"
    t.string   "tipo_adjunto"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "personas", :force => true do |t|
    t.integer  "ci"
    t.string   "nombre"
    t.string   "apaterno"
    t.string   "amaterno"
    t.string   "sexo"
    t.integer  "profesion_id"
    t.string   "fono_ofi"
    t.string   "fono_casa"
    t.string   "fono_movil"
    t.integer  "tipo_id"
    t.date     "fecha_nac"
    t.string   "file_foto"
    t.string   "file_ci"
    t.string   "file_titulo"
    t.integer  "universidad_id"
    t.integer  "cargo_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "profesiones", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "universidades", :force => true do |t|
    t.string   "nombre"
    t.integer  "ciudad_id"
    t.string   "abreviacion"
    t.string   "tipo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.integer  "persona_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
