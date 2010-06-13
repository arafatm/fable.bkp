require 'rubygems'
<<<<<<< HEAD
require 'dm-migrations'
=======
require 'bundler'
Bundler.setup

require 'dm-core'
>>>>>>> a61380e9eb73f373237a5828446d5c79d5f0da5f

Dir.glob('lib/*.rb') do |model|
  require model
end

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/fable.db")
DataMapper.auto_upgrade!
