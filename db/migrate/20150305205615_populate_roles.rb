class PopulateRoles < ActiveRecord::Migration
  def up
    ['OWNER', 'RECEPTIONIST', 'DOCTOR', 'CUSTOMER'].each do |name|
      Role.find_or_create_by(name: name)
    end
  end

  def down
    ['OWNER', 'RECEPTIONIST', 'DOCTOR', 'CUSTOMER'].each do |name|
      role = Role.find_by(name: name)
      role.destroy if role
    end
  end
end
