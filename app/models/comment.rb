class Comment < ApplicationRecord
  belongs_to: user
  belongs_to: relation1, polymorphic => true
end
