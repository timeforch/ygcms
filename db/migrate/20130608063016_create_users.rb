class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login_name,limit:20,null:false
      t.string :user_name,limit:20
      t.string :password,limit:32,null:false
      t.boolean :enabled,null:false,default:0
      t.string :phone_number,limit:11

      t.timestamps
    end
  end
end
