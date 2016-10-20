class Comment < ActiveRecord::Base
  belongs_to :posts

  VALIDATION_REGEXP =  /A((http | https | ftp)?:\/\/)?/
  VALIDATION_FIST_POST = /A(First Post | first post)/

  validates :body, length: {minimum: 2, maximum: 300}
  validates :body, format: { with: VALIDATION_REGEXP}
  validates :body, format: { with: VALIDATION_FIST_POST}
end
