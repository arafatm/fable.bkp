require 'rubygems'
require 'dm-core'
require 'dm-migrations'
require 'dm-is-list'
require 'dm-validations'
require 'dm-serializer'
require 'sinatra'
require 'logger'

require 'bacon'

Dir.glob('lib/models/*.rb') do |lib|
  require lib
end

require 'lib/plan.rb'

DataMapper.setup(:default, 'sqlite3::memory:')
DataMapper.auto_migrate!

class App < Sinatra::Base
  configure do
    LOGGER = Logger.new("sinatra.log") 
  end

  helpers do
    def logger
      LOGGER
    end
  end
end
