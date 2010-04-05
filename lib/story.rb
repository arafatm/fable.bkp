require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'dm-core'
require 'dm-is-list'
require 'dm-validations'
require 'dm-serializer'

DataMapper.setup(:default, 'sqlite3:fable.db')

class Story

  include DataMapper::Resource

  is :list
  
  property :id, Serial
  property :description, Text
  property :points, Integer
  property :position, Integer
  property :status, Text

  default_scope(:default).update(:order => [:position.asc])

  validates_present :description

  STATUSES=['Ready', 'In Progress', 'Verify', 'Done']

  def statuses
    Story::STATUSES
  end

end

DataMapper.auto_upgrade!

get '/' do
  @stories = Story.all
  haml :list
end

get '/main.css' do
  sass :main
end
