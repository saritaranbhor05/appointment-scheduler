class AddColumnsInAppointment < ActiveRecord::Migration
  def up
    remove_column :users, :pet_doctor_id, :integer
    remove_column :users, :customer_id, :integer
    add_column :appointments, :doctor_id, :integer, index: true
    add_column :appointments, :customer_id, :integer, index:true
  end

  def down
    remove_column :appointments, :doctor_id
    remove_column :appointments, :customer_id
  end
end
