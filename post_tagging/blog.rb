require './post_tagging/post'

class Blog
  attr_reader :id, :posts

  def initialize(attributes)
    @id = attributes[:id]
    @posts = attributes[:posts]
  end

  def tag_cloud
    tag_names = []
    posts.each do |post|
      post.tags.each do |tag|
        tag_names << tag.name
      end
    end
    tag_names.uniq!
  end
end
