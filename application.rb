require 'rubygems'
require 'dm-core'

Dir.glob('lib/*.rb') do |model|
  require model
end

DataMapper.setup(:default, 'sqlite3::memory:')
DataMapper.auto_migrate!
