class Event < ActiveRecord::Base
  belongs_to :user
  has_many :notifications, as: :notifiable, dependent: :destroy
  accepts_nested_attributes_for :notifications, allow_destroy: true


  validates :title,:details,:date, presence: true
  validate :date_cannot_be_in_the_past
  validate :time_cannot_be_in_the_past
  validate :finish_time_cannot_be_before_start_time
  # validates :duration, numericality: {greater_than: 0, less_than_or_equal_to: 600}
  after_create :add_notifications
  before_destroy :remove_notification



  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if
        !date.blank? and date < Date.today
  end

  def time_cannot_be_in_the_past
    errors.add(:start, "can't be in the past") if
        date == Date.today and !start.blank? and Time.parse(start.strftime("%I:%M%p"))<Time.parse(Time.now.strftime("%I:%M%p"))
  end

  def add_notifications

    users = User.all - [user_id]
    users.each do |user|
      Notification.create(user_id: user.id,notifiable_id: self.id, notifiable_type: 'Event')
    end

  end

  def remove_notification
    notifications = Notification.where(notifiable_type: 'Event',notifiable_id: self.id)
    notifications.destroy_all
  end

  def finish_time_cannot_be_before_start_time
    errors.add(:start, 'Finish time can not be before start time') if (self.start > self.finish)
  end
end
