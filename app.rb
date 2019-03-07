require_relative 'lib/router'
require_relative 'lib/repositories/posts_repository'
require_relative 'lib/controllers/posts_controller'

posts_csv = File.join(File.dirname(__FILE__), 'data/posts.csv')

posts_repository = PostsRepository.new(posts_csv)

posts_controller = PostsController.new(posts_repository)

router = Router.new(posts_controller)

router.run
