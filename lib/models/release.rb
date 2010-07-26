class Release

  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :date, Date

  has n, :stories
end
