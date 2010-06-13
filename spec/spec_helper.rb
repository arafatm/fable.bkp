require 'rubygems'
<<<<<<< HEAD
require 'dm-migrations'
require 'bacon'
=======
require 'bundler'
Bundler.setup

require 'dm-core'
>>>>>>> a61380e9eb73f373237a5828446d5c79d5f0da5f

Dir.glob('lib/*.rb') do |lib|
  require lib
end

DataMapper.setup(:default, 'sqlite3::memory:')
DataMapper.auto_migrate!
