class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :sid,limit:32,null:false
      t.string :url
      t.string :action_name,limit:32,null:false

      t.timestamps
    end
  end
end
