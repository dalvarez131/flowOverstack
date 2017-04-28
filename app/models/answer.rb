class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :comentable
  has_many :votes, as: :votable

  validates :description, presence: true
end
