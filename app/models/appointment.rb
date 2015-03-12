class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :doctor, class_name: "User"
  belongs_to :customer, class_name: "User"
  validate :visit_date_cannot_be_in_the_past
 
  def visit_date_cannot_be_in_the_past
    if visit_date.present? && visit_date < Time.now
      errors.add(:visit_date, "can't be in the past")
    end
  end
end
