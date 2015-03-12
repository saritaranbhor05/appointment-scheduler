class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :visit_date, :reason, :required_reminder
  has_one :pets
end
