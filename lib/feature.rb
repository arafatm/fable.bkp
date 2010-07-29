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
