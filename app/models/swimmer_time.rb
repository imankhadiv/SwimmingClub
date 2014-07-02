class SwimmerTime < ActiveRecord::Base
  belongs_to :swimmer

  STROKE_TYPES = %w(BACK BREAST BUTTERFLY MEDLEY FREESTYLE)
  LENGTH = %w(25 50 100 200 400 800 1500)

  def age_group
    #self.date.year - self.swimmer.date_of_birth.year
    date.year.to_i - swimmer.date_of_birth.year.to_i
  end


end
