class CreateSequenceQues < ActiveRecord::Migration
  def change
    create_table :sequence_ques do |t|
      t.integer  :context_id, :null => false
      t.string   :sequence, :null => false
      t.integer  :error_count, :default => 0
      t.string   :last_error
      
      t.timestamps
    end
    add_index :sequence_ques, :context_id
    add_index :sequence_ques, [:context_id, :sequence], :unique => true
  end
end
