module UsersHelper


  def user_levels user
    roles = ''
    user.roles.each do |role|
       roles+= "#{role.name}, "
    end
    roles[0..-3]
  end


end
