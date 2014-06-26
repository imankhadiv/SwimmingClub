class Swimmer < ActiveRecord::Base
  belongs_to :user
  has_many :swimmer_times
  has_and_belongs_to_many :parents
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address, allow_destroy: true


  def swimmer_name
    u = User.find(self.user_id)
    u.combined_name
  end
end
