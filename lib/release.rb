#get '/release' do
#  @releases = Release.all
#  @releases = Release.all
#  haml :release_new
#end
#
#post '/release' do
#  content_type :json
#
#  f = Release.new(:description => params['description'])
#  if f.save
#    f.to_json
#  else
#   "Unable to save release".to_json
#  end
#end
#
#get '/release/:id' do
#  content_type :json
#  Release.first(:id => params["id"]).to_json
#end
#
#post '/release/:id' do
#  content_type :json
#
#  f = Release.first(:id => params["id"])
#  f.description = params[:description]
#  f.save
#  f.to_json
#end
#
#get '/release/:id/stories' do
#  content_type :json
#  puts "delete #{params[:id]}"
#  Release.all(:id => params["id"]).stories.to_json
#end
#
#delete '/release/:id' do
#  content_type :json
#  puts "delete #{params[:id]}"
#  f = Release.first(:id => params["id"]) 
#  if f == nil
#    return false.to_json
#  else
#    f.destroy.to_json
#  end
#end
