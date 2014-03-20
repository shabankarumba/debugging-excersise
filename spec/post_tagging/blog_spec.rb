require 'spec_helper'
require './post_tagging/blog'

describe Blog do

  let(:post) { Post.new(id: 2) }

  subject do
    Blog.new(id: 1, posts: [post])
  end

  it "has an id" do
    subject.id.should eq 1
  end

  it "has a collection of posts" do
    subject.posts.should eq [post]
  end

  describe "#tag_cloud" do
    describe "when there are no posts" do
      subject { Blog.new(posts: []) }
      it "returns an empty array" do
        subject.tag_cloud.should eq []
      end
    end

    describe "when there is one post and one tag" do
      let(:tag)  { Tag.new(id: 47, name: "test") }
      let(:post) { Post.new(id: 2, tags: [tag])  }

      subject { Blog.new(posts: [post]) }

      it "returns the tag's name from that post" do
        subject.tag_cloud.should eq ["test"]
      end
    end

    describe "when there is many posts and many tags" do
      let(:tag_a)  { Tag.new(id: 47, name: "a tag") }
      let(:tag_b)  { Tag.new(id: 47, name: "b tag") }
      let(:tag_c)  { Tag.new(id: 47, name: "c tag") }
      let(:tag_d)  { Tag.new(id: 47, name: "d tag") }
      let(:post_a) { Post.new(id: 1, tags: [tag_a, tag_b])  }
      let(:post_b) { Post.new(id: 2, tags: [tag_c, tag_d])  }

      subject { Blog.new(posts: [post_a, post_b]) }

      it "returns the tag's name from that post" do
        subject.tag_cloud.should eq ["a tag", "b tag", "c tag", "d tag"]
      end
    end

    describe "when there are duplicated tags" do
      let(:tag_a)  { Tag.new(id: 47, name: "a tag") }
      let(:tag_b)  { Tag.new(id: 47, name: "b tag") }
      let(:post_a) { Post.new(id: 1, tags: [tag_a, tag_b])  }
      let(:post_b) { Post.new(id: 2, tags: [tag_a, tag_b])  }

      subject { Blog.new(posts: [post_a, post_b]) }

      it "returns each tag name only once" do
        subject.tag_cloud.should eq ["a tag", "b tag"]
      end
    end
  end
end

