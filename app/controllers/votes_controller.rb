enable :sessions

post '/questions/:id/votes' do
  @question = Question.find_by(id: params[:id])

  if params[:value] == "WORD!"
    @vote = @question.votes.create(value: true, voter_id: current_user.id)
  else
    @vote = @question.votes.create(value: false, voter_id: current_user.id)
  end

  redirect "/questions/#{@question.id}"
end


post '/answers/:id/votes' do
  @answer = Answer.find_by(id: params[:id])
  @question_id = @answer.question_id

  if params[:value] == "WORD!"
    @vote = @answer.votes.create(value: true, voter_id: current_user.id)
  else
    @vote = @answer.votes.create(value: false, voter_id: current_user.id)
  end

  redirect "/questions/#{@question_id}"
end
