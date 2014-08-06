class MedicalCondition < ActiveRecord::Base
  belongs_to :swimmer
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true



  DISABILITY = %w(N/A Ambulant Hearing Visual Learning Wheelchair)
end
