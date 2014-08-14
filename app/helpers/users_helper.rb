module UsersHelper


  def user_levels user
    roles = ''
    user.roles.each do |role|
       roles+= "#{role.name}"
       roles << ' '
    end
    roles
  end


end
