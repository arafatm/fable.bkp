require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'dm-core'
require 'dm-is-list'
require 'dm-validations'
require 'dm-serializer'

require File.expand_path(File.dirname(__FILE__) + '/../lib/task')

DataMapper.setup(:default, 'sqlite3:fable.db')

class Feature

  include DataMapper::Resource

  property :id, Serial
  property :description, Text

  has n, :tasks, :through => Resource

end

DataMapper.auto_upgrade!
