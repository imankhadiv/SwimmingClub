class Parent < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :swimmers
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address, allow_destroy: true


  RELATION = %w(Father Mother Guardian)
  scope :user, lambda {|user| where(user: user)}

end
