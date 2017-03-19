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

ActiveRecord::Schema.define(version: 20170319031915) do

  create_table "answers", force: :cascade do |t|
    t.text     "body"
    t.integer  "choice_id"
    t.integer  "question_id"
    t.integer  "response_id"
    t.string   "issue"
    t.text     "action"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["choice_id"], name: "index_answers_on_choice_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["response_id"], name: "index_answers_on_response_id"

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index"
  add_index "audits", ["created_at"], name: "index_audits_on_created_at"
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid"
  add_index "audits", ["user_id", "user_type"], name: "user_index"

  create_table "choices", force: :cascade do |t|
    t.string   "name"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id"

  create_table "question_lists", force: :cascade do |t|
    t.string   "name"
    t.integer  "sort"
    t.integer  "active_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "name"
    t.integer  "question_list_id"
    t.integer  "sort"
    t.integer  "qtype"
    t.integer  "survey_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "questions", ["question_list_id"], name: "index_questions_on_question_list_id"
  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id"

  create_table "responses", force: :cascade do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "responses", ["survey_id"], name: "index_responses_on_survey_id"
  add_index "responses", ["user_id"], name: "index_responses_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id"

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 1073741823
    t.datetime "created_at"
    t.text     "object_changes", limit: 1073741823
    t.integer  "transaction_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id"

end
