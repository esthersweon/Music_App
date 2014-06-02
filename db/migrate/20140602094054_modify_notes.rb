class ModifyNotes < ActiveRecord::Migration
  def change
  	drop_table :notes

  	create_table :notes do |t|
      t.integer :user_id, null: false
      t.integer :track_id, null: false
      t.text :body, null: false

      t.timestamps
    end
    add_index :notes, :user_id
  end
end
