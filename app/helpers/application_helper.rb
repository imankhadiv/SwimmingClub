module ApplicationHelper
  attr_accessor :events_notification_number
  def nav_link_to(current_identifier, *args, &block)
    identifier = block_given? ? args[1].delete(:identifier) : args[2].delete(:identifier)
    content_tag :li, class: (:active if identifier == current_identifier) do
      link_to(*args, &block)
    end
  end

  def navbar_link_to(*args, &block)
    nav_link_to(@current_nav_identifier, *args, &block)
  end
  def subnav_link_to(*args, &block)
    nav_link_to(@current_subnav_identifier, *args, &block)
  end

  def no_record_tr(colspan, text = 'No records to display')
    content_tag(:tr, content_tag(:td, text, colspan: colspan, class: 'text-center text-muted' ), class: 'tr-no-record')
  end

  #this is the method for generating different flash messages. Sometimes info might be needed for different kind of messages
  def flash_class(name)
    if name == 'notice'
      'success'
    #elsif name == :notifications
    #    'info'
    else
      'danger'
    end
  end

  # When each page loads the number of notifications for different message boards should be updated
  def events_notification_number
    @notifications = Notification.number_of_notifications_for_events current_user
  end


  # For new notifications user needs to click on the conversation and navigates to that page. This method
  def get_notifications notifiable_type
    n = Notification.where(user_id:current_user, notifiable_type: notifiable_type)
    events_id = Array.new
    n.each do |v|
      events_id << v.notifiable_id
    end
    events = Event.where(id:events_id)

  end


  # This method implemented to enable the user click on the notifications and be navigated to the message board
  def link_to_event event_id
    event = Event.find(event_id)
    event_path(event)
  end



end

