class Post < ActiveRecord::Base

  validates_presence_of :title, :body
  validates :title, length: {minimum: 5, maximum: 20}
  validates :body, length: {minimum: 200}

end
