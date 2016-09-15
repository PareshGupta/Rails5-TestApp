class UnpublishPost

  def self.before_unpublish(obj)
    puts obj
    puts 'before unpublish'
  end
end

