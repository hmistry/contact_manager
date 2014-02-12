class Company < ActiveRecord::Base
  include Contact
  validates :name, presence: true
  belongs_to :user

  def to_s
    "#{name}"
  end
end
