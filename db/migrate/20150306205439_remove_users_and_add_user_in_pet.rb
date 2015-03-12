class RemoveUsersAndAddUserInPet < ActiveRecord::Migration
  def up
    remove_column :pets, :users_id, :integer, index: true
    add_column :pets, :user_id, :integer, index: true
  end

  def down
    add_column :pets, :users_id, :integer, index: true
    remove_column :pets, :user_id, :integer, index: true
  end
end
