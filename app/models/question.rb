class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :comments, as: :comentable
  has_many :votes, as: :votable

  validates :title, :description, presence: true 
end
