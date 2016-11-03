class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |post|
      post.string :title
      post.string :body
      post.integer :user_id
    end
  end
end
