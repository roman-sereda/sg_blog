class Comment < ActiveRecord::Base
  belongs_to :posts

  VALIDATION_FIST_POST = /\A(Post first | post first)/
  VALIDATION_REGEXP = /\A(http | https)/

  validates :body, length: {minimum: 2, maximum: 300}, format: { with: VALIDATION_FIST_POST}
  validates :body, format: { with: VALIDATION_REGEXP}
end
