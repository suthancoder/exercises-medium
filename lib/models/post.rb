class Post

  def initialize(attributes = {})
    @path = attributes[:path]
    @title = attributes[:title]
    @content = attributes[:content]
    @read = attributes[:read] || false
  end

end
