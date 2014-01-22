class Person < ActiveRecord::Base

  validates_length_of :name, :minimum => 4, :too_short => "WARNING: Names can not be less than 4 characters"
  validates_numericality_of  :salary, :only_integer => true, :greater_than_or_equal_to => 0,
                             :message => "WARNING: Salary must be an integer greater than or equal to zero"
  validates_presence_of :postcode
  validate :state_exists

  belongs_to :state

  def state_exists
    errors.add(:state_id, "WARNING: State does not exist") if self.state.blank?
  end
end
