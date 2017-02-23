20.times do
  user_info = {
    username: Faker::Superhero.name,
    hashed_password: "password"
  }
  User.create(user_info)
end

40.times do
  question_info = {
    title: "Who is" + Faker::HarryPotter.character,
    content: Faker::HarryPotter.quote + "?",
    author_id: rand(1..20)
  }
  Question.create(question_info)
end

80.times do
  answer_info = {
    content: Faker::Hipster.paragraph,
    wackest: false,
    question_id: rand(1..20),
    responser_id: rand(1..20)
  }
  Answer.create(answer_info)
end

50.times do
  comment_info = {
    comment_body: Faker::StarWars.quote,
    commenter_id: (1..20).to_a.sample,
    commentable_id: (1..40).to_a.sample,
    commentable_type: ['Question', 'Answer'].sample
  }
  Comment.create(comment_info)
end
