require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'dm-core'
require 'dm-is-list'
require 'dm-validations'
require 'dm-serializer'

DataMapper.setup(:default, 'sqlite3:fable.db')

class Release

  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :date, Date

end

DataMapper.auto_upgrade!
