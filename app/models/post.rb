class Post < ActiveRecord::Base
  has_many :comments
  accepts_nested_attributes_for :comments

  after_commit :flush_cache


  def self.cached_posts
    Rails.cache.fetch('all_posts') {Post.all.to_a}
  end

  def flush_cache
    Rails.cache.delete('all_posts')
  end

end
