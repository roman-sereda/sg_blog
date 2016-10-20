class Comment < ActiveRecord::Base
  belongs_to :posts

  VALIDATION_FIST_POST = /First post/
  VALIDATION_LINK = /(([a-z0-9\-\.]+)?[a-z0-9\-]+(!?\.[a-z]{2,4}))/

  validates :body, length: {minimum: 2, maximum: 300}
  validates :body, format: { without: VALIDATION_FIST_POST}
  validates :body, format: { without: VALIDATION_LINK}
end
