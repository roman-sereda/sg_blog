class Comment < ActiveRecord::Base
  belongs_to :posts

  validates :body, length: {minimum: 5, maximum: 300}
end
