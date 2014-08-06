class Parent < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :swimmers
  has_one :address, as: :addressable, dependent: :destroy
  # before_destroy :destroy_user
  accepts_nested_attributes_for :address, allow_destroy: true


  RELATION = %w(Father Mother Guardian)
  scope :user, lambda {|user| where(user: user)}
  # before_destroy { |parent| User.destroy_all "id = #{parent.user.id}"   }


end
