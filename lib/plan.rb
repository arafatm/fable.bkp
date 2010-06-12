require File.expand_path(File.dirname(__FILE__) + '/../application')
require 'sinatra'

get '/' do
  @features = Feature.all
  @releases = Release.all(:order => :date)
  haml :planning
end
