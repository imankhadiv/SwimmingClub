class Event < ActiveRecord::Base
  belongs_to :user
  validates :title,:details,:date,:time,:duration, presence: true
  validate :date_cannot_be_in_the_past
  validate :time_cannot_be_in_the_past
  validates :duration, numericality: {greater_than: 0, less_than_or_equal_to: 600}



  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if
        !date.blank? and date < Date.today
  end

  def time_cannot_be_in_the_past
    errors.add(:time, "can't be in the past") if
        date == Date.today and !time.blank? and Time.parse(time.strftime("%I:%M%p"))<Time.parse(Time.now.strftime("%I:%M%p"))
  end

end
