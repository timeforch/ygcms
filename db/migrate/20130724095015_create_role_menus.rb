class CreateRoleMenus < ActiveRecord::Migration
  def change
    create_table :role_menus do |t|
      t.string :role_id
      t.string :menu_id

      t.timestamps
    end
  end
end
