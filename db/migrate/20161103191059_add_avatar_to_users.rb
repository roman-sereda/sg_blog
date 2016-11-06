class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :latitude, :float, default: 0
    add_column :users, :longitude, :float, default: 0
    add_column :users, :adress, :string
  end
end
