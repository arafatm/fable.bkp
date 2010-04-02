require 'dm-core'
require 'dm-is-list'
require 'dm-validations'

DataMapper.setup(:default, 'sqlite3:fable.db')

class Status

  include DataMapper::Resource

  property :id, Serial
  property :name, Text

  validates_present :name
end

DataMapper.auto_upgrade!