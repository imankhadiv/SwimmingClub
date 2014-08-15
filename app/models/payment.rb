class Payment < ActiveRecord::Base
  belongs_to :swimmer
  validates :details,:due_date,:amount, presence: true


  validate :date_cannot_be_in_the_past
  validates :amount, numericality: { greater_than_or_equal_to: 0.01 }




  def date_cannot_be_in_the_past
    errors.add(:due_date, "can't be in the past") if
        !due_date.blank? and due_date < Date.today
  end
end
