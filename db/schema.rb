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

ActiveRecord::Schema.define(version: 20161021123042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "quest_items", force: :cascade do |t|
    t.integer  "state",    default: 0,               comment: "Доступность квеста для участника"
    t.uuid     "user_id",               null: false, comment: "Пользователь ответивший на задание"
    t.uuid     "quest_id",              null: false, comment: "Пользователь ответивший на задание"
    t.json     "data",     default: {},              comment: "Ответ пользователя"
    t.datetime "start_at",              null: false, comment: "Время когда квест, становится активным"
    t.datetime "end_at",                null: false, comment: "Время когда квест, становится неактивным"
  end

  create_table "quests", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string  "title",                           null: false, comment: "Название квеста"
    t.text    "description",                     null: false, comment: "Описание задания"
    t.text    "hint",                                         comment: "Подсказка, если пользователь дал неверный ответ"
    t.integer "points",      default: 1,         null: false
    t.string  "code",                            null: false, comment: "Тип квеста"
    t.integer "state",       default: 0,         null: false, comment: "Статус квеста, показывать/не показывать"
    t.text    "answer",                          null: false, comment: "Правильный ответ, можно json запихать туда"
    t.string  "checker",     default: "compare", null: false, comment: "Метод отвечающий за проверку ответа"
    t.integer "priority",    default: 100000,                 comment: "Порядок квестов"
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "nickname",                                            comment: "Прозвище, логин или @упоминание"
    t.string   "full_name",                                           comment: "Полное имя"
    t.string   "company",                                             comment: "Название компании, в которой сейчас работает"
    t.string   "gender",                                              comment: "Пол"
    t.date     "date_of_birth",                                       comment: "Дата рождения"
    t.boolean  "hireable",                                            comment: "Ищет ли пользователь работу"
    t.string   "website_url",                                         comment: "Адрес персональной странички или блога"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "github_uid",                                          comment: "Внутренний идентификатор пользователя в GitHub"
    t.string   "github_url",                                          comment: "Адрес профиля пользователя в GitHub"
    t.string   "facebook_uid",                                        comment: "Внутренний идентификатор пользователя в Facebook"
    t.string   "facebook_url",                                        comment: "Адрес профиля пользователя в Facebook"
    t.string   "vkontakte_uid",                                       comment: "Внутренний идентификатор пользователя в VK"
    t.string   "vkontakte_url",                                       comment: "Адрес профиля пользователя в VK"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "points",                 default: 0,     null: false, comment: "Сумма набранных очков за пройденные квесты"
    t.boolean  "active",                 default: true,  null: false, comment: "Участвует ли в квестах и рейтинге"
    t.boolean  "admin",                  default: false, null: false, comment: "Имеет ли все права и доступ в админку"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["facebook_uid"], name: "index_users_on_facebook_uid", unique: true, using: :btree
    t.index ["github_uid"], name: "index_users_on_github_uid", unique: true, using: :btree
    t.index ["points"], name: "users_top_rating_index", order: {"points"=>:desc}, where: "active", using: :btree, comment: "Индекс для быстрого вывода рейтинга пользователей (топ)"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["vkontakte_uid"], name: "index_users_on_vkontakte_uid", unique: true, using: :btree
  end

end
