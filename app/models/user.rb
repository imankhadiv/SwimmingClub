  class User < ActiveRecord::Base

    validates :first_name,:last_name, presence: true
    has_one :swimmer
    has_one :parent
    has_and_belongs_to_many :roles
    before_save :assign_roles_to_user


    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    before_destroy { |user| Swimmer.destroy_all "user_id = #{user.id}"   }
    before_destroy { |user| Parent.destroy_all "user_id = #{user.id}"   }


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

    def self.awaiting_users
      users = User.where(approved: false,level: ['Committee','Coach','Welfare Officer','Administrator'])
      users += User.awaiting_swimmers
      users += User.awaiting_parents

    end

    def self.awaiting_swimmers
      swimmers = []
      users = User.where(approved: false, level: 'Swimmer')
      users.each do |user|
        swimmers << user unless (Swimmer.user user).empty?
      end
      swimmers
    end

    def self.awaiting_parents
      parents = []
      users = User.where(approved: false, level: 'Parent')
      users.each do |user|
          parents << user unless (Parent.user user).empty?
      end
      parents
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

    def self.user_profile(user_id)
      user = User.find(user_id)

      if user.level == 'Swimmer'
        Swimmer.find_by user_id: user_id
      elsif user.level == 'Parent'
        Parent.find_by user_id: user_id
      else
        user
      end
    end
    def combined_name
      "#{self.first_name} #{self.last_name}"
    end

    def role?(role_string)
      return !!self.roles.find_by_name(role_string.to_s.camelize)
    end

    def assign_roles_to_user
      role = Role.find_by(name: self.level)
      unless self.roles.include? role
      self.roles << role
      end
      # self.roles.uniq!
    end

  end
