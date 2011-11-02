class CreateFanArts < ActiveRecord::Migration
  def change
    create_table :fan_arts do |t|
      t.integer  :context_id, :null => false
      t.string   :sequence, :null => false
      t.string   :title
      t.string   :author
      t.string   :url
      t.string   :image_url
      t.string   :thumbnail_url
      t.datetime :published_at
      t.text     :comment
      
      t.timestamps
    end
    add_index :fan_arts, [:context_id, :sequence], :unique => true
    add_index :fan_arts, :author
  end
end
