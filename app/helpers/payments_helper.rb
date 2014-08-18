module PaymentsHelper





  def payment_navigation_links(payment)
    content_tag :h3 do
      # if (current_user.role? "ProductionTeam")
      [
          link_to('<i class="icon-circle-arrow-left"></i> Back'.html_safe,payments_path),
          '|',
          link_to('<i class="icon-edit-sign"></i> Edit'.html_safe, edit_payment_path(payment)),
          '|'                                                        ,
          link_to('<i class="icon-trash"></i> Delete'.html_safe,payment, :method => :delete, :data => { :confirm => 'Are you sure?'})
      ].join(' ').html_safe
      # else
      #   [link_to('<i class="icon-circle-arrow-left"></i> Back'.html_safe,shows_path)].join(' ').html_safe
      # end
    end
  end
end
