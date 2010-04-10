require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'dm-core'
require 'dm-is-list'
require 'dm-validations'
require 'dm-serializer'

DataMapper.setup(:default, 'sqlite3:fable.db')

class Feature

  include DataMapper::Resource

  property :id, Serial
  property :description, Text

end

DataMapper.auto_upgrade!

get '/' do
  @features = Feature.all
end

get '/main.css' do
  sass :main
end
