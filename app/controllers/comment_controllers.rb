post '/comment' do
  # find the comments questions id
  # use that for the commentable id/type

  content = params[:comment_content]
  Comment.create
end
