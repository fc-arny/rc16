class AddPriority < ActiveRecord::Migration[5.0]
  def change
    add_column :quests, :priority, :integer, default: 100000, comment: 'Порядок квестов'
  end
end
