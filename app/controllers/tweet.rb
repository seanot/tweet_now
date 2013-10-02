get '/send_tweets' do
  @user = current_user
  erb :send_tweets
end

get '/' do
  @user = current_user
  erb :index
end



# get 'status/:job_id' do
  
# end


#===========POST==============#

post '/tweets' do 
  redirect to("/#{params[:username]}")
end

post '/user/:id/send_tweets' do
  puts "*******************"
  p user =User.find(params[:id])
  puts "*******************"
  job_id = user.tweet(params[:text])
  # redirect to("/status/#{job_id}")
  if job_is_complete(job_id)
    @message = "job is complete"
  else
    @message = "job is not completed"
  end
  erb :status, layout: false
 # redirect '/'
end



