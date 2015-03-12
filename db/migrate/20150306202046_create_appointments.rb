class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :visit_date
      t.string :reason
      t.boolean :required_reminder
      t.references :pets, index: true

      t.timestamps null: false
    end
  end
end
