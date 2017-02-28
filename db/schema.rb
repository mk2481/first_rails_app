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

ActiveRecord::Schema.define(version: 20170228054636) do

  create_table "pokemons", force: :cascade do |t|
    t.string   "number"
    t.string   "name"
    t.string   "type1"
    t.string   "type2"
    t.string   "ability1"
    t.string   "ability2"
    t.string   "hidden_ability"
    t.integer  "hp"
    t.integer  "attack"
    t.integer  "defence"
    t.integer  "sp_attack"
    t.integer  "sp_defence"
    t.integer  "speed"
    t.integer  "total"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
