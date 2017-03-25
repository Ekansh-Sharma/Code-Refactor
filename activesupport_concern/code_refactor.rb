module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
  end

  def find_first_comment
    comments.first(created_at DESC)
  end

  module ClassMethods
    def least_commented
      ####
    end
  end
end

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
end

class Article < ActiveRecord::Base
  include Commentable
end

class Event < ActiveRecord::Base
  include Commentable
end