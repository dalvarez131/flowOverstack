class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :description
      t.integer :vote
      t.integer :user_id

      t.timestamps
    end
  end
end