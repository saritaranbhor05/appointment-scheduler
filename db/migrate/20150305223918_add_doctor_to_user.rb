class AddDoctorToUser < ActiveRecord::Migration
  def up
    add_column :users, :doctor_id, :integer, references: :users
  end

  def down
    remove_column :users, :doctor_id
  end
end
