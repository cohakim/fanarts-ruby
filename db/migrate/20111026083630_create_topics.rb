class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer  :topic, :null => false
      t.text     :sequences
      
      t.timestamps
    end
  end
end
