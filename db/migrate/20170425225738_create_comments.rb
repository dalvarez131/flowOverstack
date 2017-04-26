class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :user_id
      t.references :relation1 ,  polymorphic => true

      t.timestamps
    end
    add_index :comments , :relation1_id
  end
end
