require 'rubygems'
require 'dm-core'
require 'dm-migrations'
require 'dm-is-list'
require 'dm-validations'
require 'dm-serializer'


Dir.glob('lib/models/*.rb') do |model|
  require model
end

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/fable.db")
DataMapper.auto_upgrade!
