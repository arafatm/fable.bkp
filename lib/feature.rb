get '/feature' do
  @features = Feature.all
  @releases = Release.all
  haml :feature_new
end

post '/feature' do
  redirect '/feature'
  if Feature.new(:description => params['description']).save
    redirect '/'
  else
    redirect '/feature'
  end
end

get '/feature/:id' do
  content_type :json
  Feature.all(:id => params["id"]).to_json
end

get '/feature/:id/stories' do
  content_type :json
  Feature.all(:id => params["id"]).stories.to_json
end
