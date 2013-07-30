class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :sid,limit:32,null:false
      t.string :name,limit:32,null:false
      t.string :parent_path
      t.string :click_url
      t.boolean :display

      t.timestamps
    end
  end
end
