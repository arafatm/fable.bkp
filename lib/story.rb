require 'dm-core'
require 'dm-is-list'
require 'dm-validations'

DataMapper.setup(:default, 'sqlite3:fable.db')

class Story

  include DataMapper::Resource

  is :list
  
  property :id, Serial
  property :description, Text
  property :points, Integer
  property :position, Integer
  property :status, Text

  default_scope(:default).update(:order => [:position.asc])

  validates_present :description

  STATUSES=['Ready', 'In Progress', 'Verify', 'Done']

  def statuses
    Story::STATUSES
  end

end

DataMapper.auto_upgrade!
