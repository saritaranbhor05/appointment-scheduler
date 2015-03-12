class RemovePetsAndAddPerInAppointment < ActiveRecord::Migration
  def up
    remove_column :appointments, :pets_id, :integer, index: true
    add_column :appointments, :pet_id, :integer, index: true
  end

  def down
    add_column :appointments, :pets_id, :integer, index: true
    remove_column :appointments, :pet_id, :integer, index: true
  end
end
