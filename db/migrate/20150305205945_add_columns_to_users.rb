class AddColumnsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :school, :string
    add_column :users, :exp_years, :integer
    add_reference :users, :role, index: true
  end

  def down
    remove_column :users, :name
    remove_column :users, :address
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip
    remove_column :users, :school
    remove_column :users, :exp_years
    remove_reference :users, :role, index: true
  end
end
