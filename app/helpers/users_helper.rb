module UsersHelper


  def user_levels user
    roles = ''
    user.roles.each do |role|
       roles+= "#{role.name}, "
    end
    roles[0..-3]
  end

  def dbs_check? user

    if user.dbs_check
      'Yes'
    else
      'No'
    end

  end


end
