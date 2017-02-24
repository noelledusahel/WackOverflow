post '/questions/:id/comments' do
  binding.pry
  id = params[:id].to_i
  question = Question.find(id)
  question.comments.create(body: params[:body], commenter_id: current_user.id)

  if response.xhr?
    content_type :json
    {body: question.comments.body}.to_json
    erb :'/comment/one_comment'
  else
    redirect "/questions/#{question.id}"
  end
end

delete '/questions/:question_id/comments/:id' do
  question = Question.find(params[:question_id])
  target_comment = question.comments.find(params[:id])
  target_comment.destroy

  redirect "/questions/#{question.id}"
end
