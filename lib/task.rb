require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'dm-core'
require 'dm-is-list'
require 'dm-validations'
require 'dm-serializer'

require File.expand_path(File.dirname(__FILE__) + '/../lib/feature')

class Task

  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :points, Integer
  property :status, Text

  belongs_to :feature
end
