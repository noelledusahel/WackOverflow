class Question < ActiveRecord::Base
  belongs_to :author, class_name: :User
  has_many :answers
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

