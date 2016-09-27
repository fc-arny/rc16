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

ActiveRecord::Schema.define(version: 20160927161623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "nickname",                                         comment: "Прозвище, логин или @упоминание"
    t.string   "full_name",                                        comment: "Полное имя"
    t.string   "company",                                          comment: "Название компании, в которой сейчас работает"
    t.string   "gender",                                           comment: "Пол"
    t.date     "date_of_birth",                                    comment: "Дата рождения"
    t.boolean  "hireable",                                         comment: "Ищет ли пользователь работу"
    t.string   "website_url",                                      comment: "Адрес персональной странички или блога"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "github_uid",                                       comment: "Внутренний идентификатор пользователя в GitHub"
    t.string   "github_url",                                       comment: "Адрес профиля пользователя в GitHub"
    t.string   "facebook_uid",                                     comment: "Внутренний идентификатор пользователя в Facebook"
    t.string   "facebook_url",                                     comment: "Адрес профиля пользователя в Facebook"
    t.string   "vkontakte_uid",                                    comment: "Внутренний идентификатор пользователя в VK"
    t.string   "vkontakte_url",                                    comment: "Адрес профиля пользователя в VK"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["facebook_uid"], name: "index_users_on_facebook_uid", unique: true, using: :btree
    t.index ["github_uid"], name: "index_users_on_github_uid", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["vkontakte_uid"], name: "index_users_on_vkontakte_uid", unique: true, using: :btree
  end

end
