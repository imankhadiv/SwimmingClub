class Swimmer < ActiveRecord::Base
  belongs_to :user
  has_many :payments, dependent: :destroy
  has_one :medical_condition, dependent: :destroy
  accepts_nested_attributes_for :medical_condition, allow_destroy: true
  has_many :swimmer_times, dependent: :destroy
  has_and_belongs_to_many :parents
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true
  validates :asa_category,:asa_number,:ethnic,:date_of_birth,:sex,:photo_consent,:current_squad, presence: true
  validate :date_cannot_be_in_the_future
  validates :asa_number, numericality: true
  before_destroy :check_parents
  # around_destroy :destroy_user




  ETHNICITY = %w(White White-British White-Irish Asian-Indian Asian-Pakistan Asian-Other Asian-Bangladeshi Chinese Mixed-White\ And\ Asian Mixed-White\ And\ Black\ Caribbean Black-Caribbean Black-African Black-Other Other\ Ethnic\ Group)
  ASA_CATEGORY = %w(Paid\ Cat3 Club\ Paid\ Cat3)
  CURRENT_SQUAD = %w(A-Squad B-Squad C-Squad Youth Masters)

  # before_destroy { |swimmer| Parent.destroy_all "swimmer_id = #{swimmer.id}" }


  scope :sex, lambda {|sex| where(sex: sex)}
  scope :user, lambda {|user| where(user: user)}

  # def swimmer_name
  #   u = User.find(self.user_id)
  #   u.combined_name
  # end
  def date_cannot_be_in_the_future
    errors.add(:date_of_birth, "can't be in the future") if
        !date_of_birth.blank? and date_of_birth > Date.today
  end
  #debugger
  #def remove_user
  #  user = User.find(user_id)
  #  puts user
  #  user.delete!
  #end
  def swimmer_name
    u = User.find(user_id)
    u.combined_name
  end


  def details_of_times

    self.swimmer_times.order(:date,:times).group_by {|e| [e.stroke,e.distance,e.course]}
  end

  def check_parents

    self.parents.each do |parent|
      User.destroy(parent.user_id) if parent.swimmers.size <= 1
    end

  end
  # def destroy_user
  #   User.destroy(self.user_id) if self.user.id
  # end

end
