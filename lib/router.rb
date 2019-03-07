
class Router

  def initialize(posts_controller)
    @posts_controller = posts_controller
  end


  def run
    counter = 0
    intro_message
    while counter != 5 do
      intro_menu
      counter = gets.chomp.to_i
      direct(counter)
    end
  end

  def direct(counter)
    case counter
    when 1
      @posts_controller.list
    when 2
      @posts_controller.add
    when 3
            puts "read"
    when 4
      @posts_controller.mark_read
    end
  end


  def intro_menu
    puts "1. List posts"
    puts "2. Save post for later"
    puts "3. Read post"
    puts "4. Mark post as read"
    puts "5. Exit"
  end

  def intro_message
  puts "____________________________________________"
  puts "    Welcome to your Medium Pocket Reader    "
  puts "____________________________________________"

  puts "____________________________________________"
  puts "        What do you want to do next?        "
  puts "____________________________________________"

  end
end
