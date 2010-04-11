require 'rubygems'
require 'dm-core'

Dir.glob('lib/*.rb') do |model|
  require model
end

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/fable.db")
DataMapper.auto_upgrade!
