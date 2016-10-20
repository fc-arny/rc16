class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, null: false, default: false, comment: 'Имеет ли все права и доступ в админку'
  end
end
