class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
end

class Article < ActiveRecord::Base
  has_many :comments, as: :commentable 

  def find_first_comment
    comments.first(created_at DESC)
  end

  def self.least_commented
    ####
  end
end

class Event < ActiveRecord::Base
  has_many :comments, as: :commentable 

  def find_first_comment
    comments.first(created_at DESC)
  end

  def self.least_commented
    ####
  end
end