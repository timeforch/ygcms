class CreateRoleMenus < ActiveRecord::Migration
  def change
    create_table :role_menus do |t|
      t.string :role_id,limit:32,null:false
      t.string :menu_id,limit:32,null:false

      t.timestamps
    end
  end
end
