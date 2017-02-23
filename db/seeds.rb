20.times do
  user_info = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Superhero.name,
    password: "password"
  }
  User.create!(user_info)
end

40.times do
  question_info = {
    title: "Who is " + Faker::HarryPotter.character + "?",
    content: Faker::HarryPotter.quote + "?",
    author_id: rand(1..20)
  }
  Question.create!(question_info)
end

80.times do
  answer_info = {
    content: Faker::Hipster.paragraph,
    wackest: false,
    question_id: rand(1..20),
    responder_id: rand(1..20)
  }
  Answer.create!(answer_info)
end

50.times do
  comment_info = {
    body: Faker::StarWars.quote,
    commenter_id: (1..20).to_a.sample,
    commentable_id: (1..40).to_a.sample,
    commentable_type: ['Question', 'Answer'].sample
  }
  Comment.create!(comment_info)
end
