post '/questions/:id/comments' do
  id = params[:id].to_i
  @question = Question.find(id)
  new_comment = @question.comments.create(body: params[:body], commenter_id: current_user.id)

  if request.xhr?

    erb :'/comments/_one_comment', locals: { comment: new_comment }, layout: false
  else
    redirect "/questions/#{@question.id}"
  end
end

delete '/questions/:question_id/comments/:id' do
  question = Question.find(params[:question_id])
  target_comment = question.comments.find(params[:id])
  target_comment.destroy

  redirect "/questions/#{question.id}"
end
