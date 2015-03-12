class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :customers, class_name: "User",
                          foreign_key: "doctor_id"
 
  belongs_to :doctor, class_name: "User"
  has_many :pets

  validates_presence_of :name, :role_id
  validates_length_of :name, maximum: 35
  validates_length_of :zip, maximum: 5

  # Get all users having role 'Doctor'
  scope :doctors_for_customer, lambda {
    uniq.joins(:role).where(roles: { name: DOCTOR_ROLE })
  }

  def doctor?
    role.name.eql?(DOCTOR_ROLE)
  end

  def customer?
    role.name.eql?('CUSTOMER')
  end

end
