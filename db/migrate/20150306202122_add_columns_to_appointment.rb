class AddColumnsToAppointment < ActiveRecord::Migration
  def up
    add_column :users, :pet_doctor_id, :integer
    add_column :users, :customer_id, :integer
  end

  def down
    remove_column :users, :pet_doctor_id
    remove_column :users, :customer_id
  end
end
