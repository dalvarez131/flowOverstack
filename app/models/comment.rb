class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :comentable, :polymorphic => true

  validates :description, presence: true
end
