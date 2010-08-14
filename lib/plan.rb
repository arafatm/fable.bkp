require File.expand_path(File.dirname(__FILE__) + '/../application')
require 'sinatra'
require 'haml'
require 'sass'


get '/' do
  @features = Feature.all
  @releases = Release.all(:order => :date)

  haml :planning
end

get '/main.css' do
  sass :main
end 

helpers do
  def cycle(*states)
    states[@_cycle = ((@_cycle || -1) + 1) % states.size]
  end 
end

load 'lib/feature.rb'
load 'lib/release.rb'
