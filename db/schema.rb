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

ActiveRecord::Schema.define(version: 5) do

  create_table "balances", force: true do |t|
    t.integer "expense_id"
    t.integer "period_id"
    t.float   "balance"
    t.float   "budget"
  end

  create_table "expenses", force: true do |t|
    t.string "name"
    t.float  "budget"
  end

  create_table "periods", force: true do |t|
    t.date    "start_date"
    t.date    "end_date"
    t.integer "position"
  end

  create_table "purchases", force: true do |t|
    t.string  "entered_by"
    t.integer "expense_id"
    t.string  "description"
    t.float   "amount"
    t.date    "purchase_date"
    t.integer "period_id"
  end

end
