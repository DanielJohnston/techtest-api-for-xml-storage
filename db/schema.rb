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

ActiveRecord::Schema.define(version: 20170701040500) do

  create_table "brochures", force: :cascade do |t|
    t.datetime "modified"
    t.text "url"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_brochures_on_property_id"
  end

  create_table "epc_front_pages", force: :cascade do |t|
    t.datetime "modified"
    t.text "url"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_epc_front_pages_on_property_id"
  end

  create_table "epc_graphs", force: :cascade do |t|
    t.datetime "modified"
    t.text "url"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_epc_graphs_on_property_id"
  end

  create_table "floorplans", force: :cascade do |t|
    t.text "url"
    t.datetime "modified"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_floorplans_on_property_id"
  end

  create_table "images", force: :cascade do |t|
    t.text "url"
    t.datetime "modified"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_images_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "property_id"
    t.integer "branch_id"
    t.text "client_name"
    t.text "branch_name"
    t.text "department"
    t.integer "reference_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "address_name"
    t.text "address_number"
    t.text "address_street"
    t.text "address2"
    t.text "address3"
    t.text "address4"
    t.text "address_postcode"
    t.text "country"
    t.text "display_address"
    t.integer "property_bedrooms"
    t.integer "property_bathrooms"
    t.integer "property_ensuites"
    t.integer "property_reception_rooms"
    t.integer "property_kitchens"
    t.text "display_property_type"
    t.integer "property_type"
    t.integer "property_style"
    t.integer "property_age"
    t.decimal "floor_area", precision: 16, scale: 2
    t.text "floor_area_units"
    t.text "property_feature1"
    t.text "property_feature2"
    t.text "property_feature3"
    t.text "property_feature4"
    t.text "property_feature5"
    t.text "property_feature6"
    t.text "property_feature7"
    t.text "property_feature8"
    t.text "property_feature9"
    t.text "property_feature10"
    t.decimal "price"
    t.decimal "for_sale_poa"
    t.integer "price_qualifier"
    t.integer "property_tenure"
    t.boolean "sale_by"
    t.boolean "development_opportunity"
    t.boolean "investment_opportunity"
    t.decimal "estimated_rental_income"
    t.integer "availability"
    t.text "main_summary"
    t.text "full_description"
    t.boolean "featured_property"
    t.integer "region_id"
    t.decimal "latitude"
    t.decimal "longitude"
    t.date "date_last_modified"
  end

  create_table "virtual_tours", force: :cascade do |t|
    t.datetime "modified"
    t.text "url"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_virtual_tours_on_property_id"
  end

end
