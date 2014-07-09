class SwimmerTime < ActiveRecord::Base
  STROKE_TYPES = %w(BACK BREAST BUTTERFLY MEDLEY FREESTYLE)
  # LENGTH = %w(25 50 100 200 400 800 1500)
  LENGTH = [25,50,100,200,400,800,1500]
  YEAR = (30.years.ago.year..Time.new.year).to_a

  M = %w(00 01 02 03 04 05 06 07 08 09)
  MINUTES = M + (10...60).to_a
  SECONDS =  M + (10...60).to_a
  MILLI_SECONDS =  M + (10...100).to_a
  belongs_to :swimmer
  validates :venue,:club,:date, presence: true
  attr_accessor :minutes, :seconds, :milli_seconds
  before_save :insert_into_times

  # scope :swim_type, lambda { |stroke| where('stroke = ?', stroke)}
  # scope :swim_type, lambda { |stroke,*length| where(stroke: stroke,length: length)}
  # scope :hi, lambda {|*args|  args.each {|item| puts item}}
  scope :stroke, lambda {|stroke| where(stroke: stroke)}
  scope :length, lambda {|distance| where(distance: "#{distance}")}
  scope :date, lambda {|year| where('extract(year from date) = ?',"#{year}")}
  scope :swimmer, lambda {|swimmer| where(swimmer: swimmer)}



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
