class AddServiceFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :active, :boolean, null: false, default: true,  comment: 'Участвует ли в квестах и рейтинге'
    add_index  :users, [:points], order: {points: :desc}, where: 'active',
      name: 'users_top_rating_index', comment: 'Индекс для быстрого вывода рейтинга пользователей (топ)'
  end
end
