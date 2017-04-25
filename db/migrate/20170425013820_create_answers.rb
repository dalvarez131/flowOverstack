class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :description
      t.string :text
      t.string :vote
      t.string :integer
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
