class Person < ActiveRecord::Base
  include Contact
  validates :first_name, :last_name, presence: true
  belongs_to :user

  def to_s
    "#{last_name}, #{first_name}"
  end
end
