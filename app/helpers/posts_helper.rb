module PostsHelper

  def post_navigation_links(post)
    content_tag :h4 do
      # if (current_user.role? "ProductionTeam")
      [
          link_to('<i class="icon-circle-arrow-left"></i> Back'.html_safe,posts_path),
          '|',
          link_to('<i class="icon-edit-sign"></i> Edit'.html_safe, edit_post_path(post)),
          '|'                                                        ,
          link_to('<i class="icon-trash"></i> Delete'.html_safe,post, :method => :delete, :data => { :confirm => 'Are you sure?(All comments will be deleted!)'})
      ].join(' ').html_safe
      # else
      #   [link_to('<i class="icon-circle-arrow-left"></i> Back'.html_safe,shows_path)].join(' ').html_safe
      # end
    end
  end



end
