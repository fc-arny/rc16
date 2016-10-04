# frozen_string_literal: true
class Quest < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :quests, id: :uuid do |t|
      t.string :title, null: false, comment: 'Название квеста'
      t.text :description, null: false, comment: 'Описание задания'
      t.text :hint, comment: 'Подсказка, если пользователь дал неверный ответ'
      t.integer :points, default: 1, null: false, comment: ''
      t.string :code, null: false, uniq: true, comment: 'Тип квеста'
      t.integer :state, default: 0, null: false, comment: 'Статус квеста, показывать/не показывать'
      t.text :answer, null: false, comment: 'Правильный ответ, можно json запихать туда'
      t.string :checker, default: 'compare', null: false, comment: 'Метод отвечающий за проверку ответа'
    end

    create_table :quest_items do |t|
      t.integer :state, default: 0, comment: 'Доступность квеста для участника'
      t.uuid :user_id, null: false, comment: 'Пользователь ответивший на задание'
      t.uuid :quest_id, null: false, comment: 'Пользователь ответивший на задание'
      t.json :data, default: {}, comment: 'Ответ пользователя'
      t.datetime :start_at, null: false, comment: 'Время когда квест, становится активным'
      t.datetime :end_at, null: false, comment: 'Время когда квест, становится неактивным'
    end
  end
end