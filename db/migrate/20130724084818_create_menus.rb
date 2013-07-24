class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :sid
      t.string :name
      t.string :parent_path
      t.string :click_url
      t.boolean :display

      t.timestamps
    end
  end
end
