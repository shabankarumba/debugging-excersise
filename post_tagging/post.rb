require './post_tagging/tag'

class Post

  attr_reader :id, :title, :body, :tags

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @body = attributes[:body]
    @tags = attributes[:tags]
  end

end
