class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :post_id
      t.timestamps :create_at
    end
  end
end
