class Comment < ActiveRecord::Base
  belongs_to :commentor, class_name: :User
  belongs_to :commentable, polymorphic: true
end
