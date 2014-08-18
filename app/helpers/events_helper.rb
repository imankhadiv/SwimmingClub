module EventsHelper




  # control the navigation links for different categories of users
  def event_navigation_links(event)
    content_tag :h3 do
      # if (current_user.role? "ProductionTeam")
        [
            link_to('<i class="icon-circle-arrow-left"></i> Back'.html_safe,calendar_index_path),
            '|',
            link_to('<i class="icon-edit-sign"></i> Edit'.html_safe, edit_event_path(event)),
            '|'                                                        ,
            link_to('<i class="icon-trash"></i> Delete'.html_safe,event, :method => :delete, :data => { :confirm => 'Are you sure?'})
        ].join(' ').html_safe
      # else
      #   [link_to('<i class="icon-circle-arrow-left"></i> Back'.html_safe,shows_path)].join(' ').html_safe
      # end
    end
  end
end
