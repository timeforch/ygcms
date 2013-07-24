class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :sid
      t.string :url
      t.string :action_name

      t.timestamps
    end
  end
end
