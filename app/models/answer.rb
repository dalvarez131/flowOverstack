class Answer < ApplicationRecord
  belongs_to: question
  belongs_to: user
  has_many: comments, :as relation1

end
