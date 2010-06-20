require 'rubygems'
require 'dm-core'
require 'dm-migrations'
require 'dm-is-list'
require 'dm-validations'
require 'dm-serializer'

require 'bacon'

Dir.glob('lib/models/*.rb') do |lib|
  require lib
end

DataMapper.setup(:default, 'sqlite3::memory:')
DataMapper.auto_migrate!
