class Post < ApplicationRecord
  belongs_to :user, foreign_key: :owner_id

  # @param [Post] exclude_post 除外したいPost
  # @return [ActiveRecord::Relation<Post>] 指定したものを除く最新投稿順のPost
  def self.new_arrival_posts(exclude_post)
    self.where.not(id: exclude_post.id).order(created_at: :desc)
  end
end
