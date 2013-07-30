class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.string :user_id,limit:32,null:false
      t.string :role_id,limit:32,null:false

      t.timestamps
    end
  end
end
