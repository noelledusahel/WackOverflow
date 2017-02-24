class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: :User
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

  def vote_score
    score = 0
    self.votes.each do |vote|
      if vote.value == true
        score += 1
      else
        score -= 1
      end
    end
    return score
  end
end
