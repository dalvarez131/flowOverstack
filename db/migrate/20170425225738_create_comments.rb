class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :user_id
      t.string :comentable_type
      t.integer :comentable_id

      t.timestamps
    end
    add_index :comments, [:imageable_type, :imageable_id]
  end
end
