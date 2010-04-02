require 'dm-core'
require 'dm-is-list'
require 'dm-validations'

DataMapper.setup(:default, 'sqlite3:fable.db')

class Status

  include DataMapper::Resource

  is :list

  property :id, Serial
  property :name, Text
  property :position, Integer

  default_scope(:default).update(:order => [:position.asc])

  validates_present :name
end

DataMapper.auto_upgrade!
