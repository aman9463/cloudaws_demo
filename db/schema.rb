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

ActiveRecord::Schema.define(version: 2019_09_11_175653) do

  create_table "aws_offer_code_prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sku"
    t.bigint "offer_code_update_status_id", null: false
    t.bigint "currency_id", null: false
    t.text "description"
    t.string "begin_range"
    t.string "end_range"
    t.string "unit"
    t.string "price_per_unit"
    t.datetime "effective_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_aws_offer_code_prices_on_currency_id"
    t.index ["offer_code_update_status_id"], name: "index_aws_offer_code_prices_on_offer_code_update_status_id"
  end

  create_table "aws_offer_codes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "offer_code"
    t.bigint "aws_region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aws_region_id"], name: "index_aws_offer_codes_on_aws_region_id"
    t.index ["offer_code"], name: "index_aws_offer_codes_on_offer_code"
  end

  create_table "aws_regions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "region_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_name"], name: "index_aws_regions_on_region_name"
  end

  create_table "master_currencies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "currency_name"
    t.string "default_currency_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["default_currency_name"], name: "index_master_currencies_on_default_currency_name"
  end

  create_table "offer_code_update_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "for_date"
    t.bigint "aws_offer_code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aws_offer_code_id"], name: "index_offer_code_update_statuses_on_aws_offer_code_id"
  end

  add_foreign_key "aws_offer_code_prices", "master_currencies", column: "currency_id"
  add_foreign_key "aws_offer_code_prices", "offer_code_update_statuses"
  add_foreign_key "aws_offer_codes", "aws_regions"
  add_foreign_key "offer_code_update_statuses", "aws_offer_codes"
end
