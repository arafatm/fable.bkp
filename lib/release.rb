require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'dm-core'
require 'dm-is-list'
require 'dm-validations'
require 'dm-serializer'

class Release

  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :date, Date

  has n, :tasks
end
