class Swimmer < ActiveRecord::Base
  belongs_to :user
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address, allow_destroy: true
end
