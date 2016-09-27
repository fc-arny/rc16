class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :users, id: :uuid do |t|
      ## Main info
      t.string  :nickname,      comment: 'Прозвище, логин или @упоминание'
      t.string  :full_name,     comment: 'Полное имя'
      t.string  :company,       comment: 'Название компании, в которой сейчас работает'
      t.string  :gender,        comment: 'Пол'
      t.date    :date_of_birth, comment: 'Дата рождения'
      t.boolean :hireable,      comment: 'Ищет ли пользователь работу'
      t.string  :website_url,   comment: 'Адрес персональной странички или блога'

      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Social network ids
      t.string :github_uid,    comment: 'Внутренний идентификатор пользователя в GitHub'
      t.string :github_url,    comment: 'Адрес профиля пользователя в GitHub'
      t.string :facebook_uid,  comment: 'Внутренний идентификатор пользователя в Facebook'
      t.string :facebook_url,  comment: 'Адрес профиля пользователя в Facebook'
      t.string :vkontakte_uid, comment: 'Внутренний идентификатор пользователя в VK'
      t.string :vkontakte_url, comment: 'Адрес профиля пользователя в VK'

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
    add_index :users, :github_uid,           unique: true
    add_index :users, :facebook_uid,         unique: true
    add_index :users, :vkontakte_uid,        unique: true
  end
end
