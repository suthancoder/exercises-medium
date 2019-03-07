class Post
  attr_reader :path, :title, :read
  attr_writer :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @path = attributes[:path]
    @title = attributes[:title]
    @read = attributes[:read] || false
  end


end
