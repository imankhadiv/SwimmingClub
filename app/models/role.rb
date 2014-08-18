class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  has_many :notifications, as: :notifiable, dependent: :destroy
  accepts_nested_attributes_for :notifications, allow_destroy: true


end
