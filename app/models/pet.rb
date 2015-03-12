class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :appointments

  def last_visited_date
    return '-' if appointments.blank?
    last_visit = appointments.where("visit_date < ?", Time.now)
      .order('visit_date DESC').first
    last_visit.blank? ? '-' : last_visit.visit_date
  end

  def next_visit_date
    return '-' if appointments.blank?
    current_time = Time.now
    next_visit = appointments.where("visit_date >= ?", current_time)
      .order('visit_date ASC').first
    next_visit.blank? ? '-' : next_visit.visit_date
  end
end
