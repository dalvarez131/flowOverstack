class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :comentable, :polymorphic => true
end
