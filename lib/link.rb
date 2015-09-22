class Link

  include DataMapper::Resource

  property :id,                Serial
  property :title,             String
  property :url,               String
  property :description,       String
  property :created_at,        DateTime

  # belongs_to :user
  # has n, :tags, through: Resource

  validates_presence_of :title
  validates_presence_of :url

end

