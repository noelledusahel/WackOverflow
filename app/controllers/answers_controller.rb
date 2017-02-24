enable :sessions

post '/questions/:id/answers' do
  @answer = Answer.new(content: params[:content], question_id: params[:id], responder_id: session[:user_id])

  if @answer.save
    redirect "/questions/#{params[:id]}"
  else
    @errors = @answer.errors.full_message
    erb :'questions/show'
  end
end
