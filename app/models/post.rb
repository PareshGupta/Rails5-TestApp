class Post

  include ActiveModel::Validations::Callbacks
  include ActiveModel::Validations

  extend ActiveModel::Callbacks

  attr_accessor :title, :posted_on

  validates :title, presence: true

  # before_validation :abc
  # def abc
  #   puts 'hello'
  #   return false
  # end

  define_model_callbacks :publish, only: [:before, :after]
  define_model_callbacks :unpublish, only: :before

  def publish
    run_callbacks :publish do
      puts 'running publish callback'
    end
  end

  def unpublish
    run_callbacks :unpublish do
      puts 'running unpublish callback'
    end
  end

  before_publish :do_something

  def do_something
    puts 'before callback'
  end

  before_unpublish 'UnpublishPost'

end
