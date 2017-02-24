class Answer < ActiveRecord::Base
  belongs_to :responder, class_name: :User
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :voters, through: :votes

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

