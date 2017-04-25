class User < ApplicationRecord
  has_many: answers
  has_many: questions
  has_many: answer_comments
  has_many: question_comments
end
