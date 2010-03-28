require 'dm-core'

DataMapper.setup(:default, 'sqlite3:fable.db')

class Story

  include DataMapper::Resource
  
  property :id, Serial
  property :description, Text
  property :points, Integer
  property :priority, Integer

  default_scope(:default).update(:order => [:priority.asc])
end

DataMapper.auto_upgrade!
