class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.string :title
      t.text :description
      t.datetime :start_time
      t.string :location

      t.timestamps
    end
    add_index :events, :creator_id
  end
end
