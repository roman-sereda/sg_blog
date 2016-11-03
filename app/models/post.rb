class Post < ActiveRecord::Base

  belongs_to :user

  default_scope -> { order('created_at DESC') }

  has_many :comments

  validates_presence_of :title, :body
  mount_uploader :image, ImageUploader

  validates :title, length: {minimum: 5, maximum: 100}
  validates :body, length: {minimum: 200}


end
