class SwimmerTime < ActiveRecord::Base
  belongs_to :swimmer

  STROKE_TYPES = %w(BACKSTROKE BREASTSTROKE BUTTERFLY IND.MEDLEY FREESTYLE)
  LENGTH = %w(50 100 200 400 800 1500)
end
