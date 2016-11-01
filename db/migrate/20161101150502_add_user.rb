class AddUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.integer :user_id
      t.string :password
      t.timestamps :created_at
    end
  end
end
