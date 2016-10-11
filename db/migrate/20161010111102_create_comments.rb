class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :post_id
      t.timestamps :created_at
    end
  end
end
