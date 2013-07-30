class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name,limit:20,null:false
      t.string :sid,limit:32,null:false

      t.timestamps
    end
  end
end
