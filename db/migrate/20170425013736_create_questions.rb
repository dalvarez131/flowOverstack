class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :string
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
