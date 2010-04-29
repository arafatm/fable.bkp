require 'rubygems'
require 'dm-core'

Dir.glob('lib/*.rb') do |lib|
  require lib
end

DataMapper.setup(:default, 'sqlite3::memory:')
DataMapper.auto_migrate!
