class User < ActiveRecord::Base
  validates :first_name,:last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  def self.get_awaiting_users
    User.where(approved: false)
  end

  def self.get_approved_users
    User.where(approved: true)
  end

  def  self.get_user_from_params arg
    sliced_arg = arg.slice!(:password,:password_confirmation)
    user = User.where(sliced_arg).last
  end

  def get_swimmer user_id
    Swimmer.find_by user_id: user_id
  end

  def self.get_user_profile user_id
    user = User.find(user_id)

    if user.level == 'Swimmer'
      Swimmer.find_by user_id: user_id
    elsif user.level == 'Parent'
       Swimmer.find_by user_id: user_id
    else
      user
    end
  end
end
