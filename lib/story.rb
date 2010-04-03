require 'dm-core'
require 'dm-is-list'
require 'dm-validations'

DataMapper.setup(:default, 'sqlite3:fable.db')

class Story

  include DataMapper::Resource

  is :list
  
  property :id, Serial
  property :description, Text
  property :points, Integer
  property :position, Integer

  default_scope(:default).update(:order => [:position.asc])

  validates_present :description
end

DataMapper.auto_upgrade!
