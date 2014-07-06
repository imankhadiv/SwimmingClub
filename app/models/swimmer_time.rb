class SwimmerTime < ActiveRecord::Base
  STROKE_TYPES = %w(BACK BREAST BUTTERFLY MEDLEY FREESTYLE)
  LENGTH = %w(25 50 100 200 400 800 1500)
  M = %w(00 01 02 03 04 05 06 07 08 09)
  MINUTES = M + (10...60).to_a
  SECONDS =  M + (10...60).to_a
  MILLI_SECONDS =  M + (10...100).to_a
  belongs_to :swimmer
  validates :venue,:club,:date, presence: true
  attr_accessor :minutes, :seconds, :milli_seconds
  before_save :insert_into_times


  def age_group
    #self.date.year - self.swimmer.date_of_birth.year
    date.year.to_i - swimmer.date_of_birth.year.to_i
  end

  def convert_times
    min = self.times/600
    sec = (self.times%600)/60
    milli_sec = ((self.times%600)%100)
    "#{min}:#{sec}:#{milli_sec}"
  end

  def insert_into_times
    times = self.minutes.to_i*600 + self.seconds.to_i*100 + milli_seconds.to_i
    self.times = times
  end


end
