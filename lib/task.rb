require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'dm-core'
require 'dm-is-list'
require 'dm-validations'
require 'dm-serializer'

DataMapper.setup(:default, 'sqlite3:fable.db')

class Task

  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :estimate, Integer
  property :status, Text

end

DataMapper.auto_upgrade!
