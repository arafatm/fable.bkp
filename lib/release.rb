get '/release/:id' do
  content_type :json

  Release.first(:id => params["id"]).to_json
end

post '/release' do
  content_type :json

  f = Release.new(:description => params['description'])
  if f.save
    f.to_json
  else
   "Unable to save release".to_json
  end
end

post '/release/:id' do
  content_type :json

  puts '/release/:id'
  r = Release.first(:id => params["id"])
  if params[:description]
    puts "description: #{params[:description]}"
    r.description = params[:description]
  end
  if params[:date]
    puts "date: #{params[:date]}"
    r.date = params[:date]
  end
  r.save
  r.to_json
end

get '/release/:id/stories' do
  content_type :json
  Release.first(:id => params["id"]).stories.to_json
end

delete '/release/:id' do
  content_type :json
  f = Release.first(:id => params["id"]) 
  if f == nil
    return false.to_json
  else
    f.destroy.to_json
  end
end
