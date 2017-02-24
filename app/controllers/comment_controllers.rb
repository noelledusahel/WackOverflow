post '/questions/:id/comments' do
  id = params[:id].to_i
  question = Question.find(id)
  question.comments.create(body: params[:body], commenter_id: current_user.id)

  redirect "/questions/#{question.id}"
end
