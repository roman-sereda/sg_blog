class AddCreateUpdateAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :created_at, :timestamps
    add_column :posts, :updated_at, :timestamps
  end
end
