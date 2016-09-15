class BlogPost
  # extend ActiveModel::Naming

  include ActiveModel::Model
  include ActiveModel::Conversion

  attr_accessor :id, :content

  def persisted?
    true
  end

end