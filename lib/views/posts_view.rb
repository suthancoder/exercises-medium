

class PostsView
  def display(posts_array)
    posts_array.each_with_index do |post, index|
      puts "#{index} Post title: #{post.title} #{read(post.read)}"
    end
  end

   def add(headers)
    item = []
    headers.each do |header|
      if header != "id"
        puts "Please provide the #{header}"
        data = gets.chomp
        item << data
      end
    end
    return item
  end

private

  def read(read)
    text = ""
    read ?  text = "[x]" : text = "[ ]"
    return text
  end


end

