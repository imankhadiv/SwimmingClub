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
end
