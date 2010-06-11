class Feature

  include DataMapper::Resource

  property :id, Serial
  property :description, Text

  has n, :tasks

end
