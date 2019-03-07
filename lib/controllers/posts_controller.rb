require_relative '../views/posts_view'

class PostsController
  def initialize(posts_repository)
    @posts_repository = posts_repository
    @views = PostsView.new
    @posts = []
  end

  def list
    @posts = @posts_repository.list
    @views.display(@posts)
  end

  def add
    headers = @posts_repository.headers
    item = @view.add(headers)
    array = build_item(headers, item)
    new_meal = Post.new(array.to_h)
    @posts_repository.add(new_meal)
  end


  def find
  end

  def mark_read
    puts "mark read in controller"
  end

private

  def build_item(headers, item)
    array = []
    if item.length == headers.length-1
      item.length.times do |i|
        array <<[headers[i+1].to_sym, item[i]]

      end
    else
      puts "Error building item"
    end

    return array
  end


end
