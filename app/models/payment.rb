class Payment < ActiveRecord::Base
  belongs_to :swimmer
  validates :details,:due_date,:amount, presence: true
  validate :date_cannot_be_in_the_past
  validates :amount, numericality: { greater_than_or_equal_to: 0.01 }
  # validates :due_date_cant_be_before_paid_date
  before_save :change_payment_status




  def date_cannot_be_in_the_past
    errors.add(:due_date, "can't be in the past") if
        !due_date.blank? and (due_date < Date.today)
    errors.add(:paid_date, "can't be before the due date") if
        !paid_date.blank? and (paid_date < due_date)
  end

  def change_payment_status
    unless paid_date.nil?
      self.paid = 1
    else
      self.paid = 0
    end
  end


end
