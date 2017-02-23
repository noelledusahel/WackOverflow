class User < ActiveRecord::Base
  include BCrypt

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :responder_id
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :username, presence: true
  validate :validate_password

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(input_password)
    @raw_password = input_password
    @password = Password.create(input_password)
    self.hashed_password = @password
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be greater than 6 characters")
    end
  end

  def self.authenticate(email, password)
    user = User.find_by(username: username)

    if user && user.password == password
      return user
    else
      return nil
    end
  end
end
