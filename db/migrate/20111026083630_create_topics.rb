class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer    :topic, :null => false
      t.text       :sequences
      
      t.timestamps
    end
    execute "ALTER TABLE topics MODIFY COLUMN sequences MEDIUMTEXT"
  end
end
