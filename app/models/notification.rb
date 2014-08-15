class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :notifiable, polymorphic: true



  def self.remove_notification (user_id, notifiable_id)
    Notification.where(user_id: user_id, notifiable_id: notifiable_id).destroy_all
  end

  def self.check_notification (user_id, notifiable_type)
    Notification.where(user_id: user_id, notifiable_type: notifiable_type)
  end

  def self.number_of_notifications_for_events (user_id)
    (self.check_notification user_id, 'Event').size
  end


end
