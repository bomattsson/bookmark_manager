class Link

  include DataMapper::Resource

  property :id,         Serial
  property :title,      String
  property :url,        String
  property :desc,       String
  property :created_at, DateTime
end

