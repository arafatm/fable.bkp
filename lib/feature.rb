get '/feature' do
  @features = Feature.all
  @releases = Release.all
  haml :feature_new
end

post '/feature' do
  content_type :json

  f = Feature.new(:description => params['description'])
  if f.save
    f.to_json
  else
   "Unable to save feature".to_json
  end
end

get '/feature/:id' do
  content_type :json
  Feature.first(:id => params["id"]).to_json
end

post '/feature/:id' do
  content_type :json

  f = Feature.first(:id => params["id"])
  f.description = params[:description]
  f.save
  f.to_json
end

get '/feature/:id/stories' do
  content_type :json
  puts "delete #{params[:id]}"
  Feature.all(:id => params["id"]).stories.to_json
end

delete '/feature/:id' do
  content_type :json
  puts "delete #{params[:id]}"
  f = Feature.first(:id => params["id"]) 
  if f == nil
    return false.to_json
  else
    f.destroy.to_json
  end
end
