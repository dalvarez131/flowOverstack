class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :comentable

  validates :description, presence: true
end
