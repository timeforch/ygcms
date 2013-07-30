class CreateMenuOpers < ActiveRecord::Migration
  def change
    create_table :menu_opers do |t|
      t.string :menu_id,limit:32,null:false
      t.string :oper_id,limit:32,null:false

      t.timestamps
    end
  end
end
