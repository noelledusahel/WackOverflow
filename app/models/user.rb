class User < ActiveRecord::Base
  has_many: :questions, foreign_key: :author_id
  has_many: :answers, foreign_key: :responder_id
  has_many: :comments, as: :commentable
  has_many: :votes, as: :votable

end
