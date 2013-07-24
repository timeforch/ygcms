class CreateMenuOpers < ActiveRecord::Migration
  def change
    create_table :menu_opers do |t|
      t.string :menu_id
      t.string :oper_id

      t.timestamps
    end
  end
end
