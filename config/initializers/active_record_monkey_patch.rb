class ActiveRecord::Base

  def date_cannot_be_in_the_future
    errors.add(:date, "can't be in the past") if
        !date.blank? and date > Date.today
  end
end
