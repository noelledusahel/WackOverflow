
get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/show'
end

post '/questions' do
  @question = Question.new(title: params[:title], content: params[:content], author_id: session[:user_id] )
  if @question.save
    redirect '/questions'
  else
    @errors = @question.errors.full_message
    erb :'questions/new'
  end
end
