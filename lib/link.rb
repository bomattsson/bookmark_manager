class Link
	include DataMapper::Resource

	property :id, Serial
	property :title, String
	property :description, Text
	property :url, String
	property :created_at, DateTime

	 