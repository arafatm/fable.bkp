class Story

  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :points, Integer
  property :status, Text

  belongs_to :feature
  belongs_to :release, :required => false
end
