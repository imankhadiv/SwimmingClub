class SwimmerTime < ActiveRecord::Base
  STROKE_TYPES = %w(BACK BREAST BUTTERFLY MEDLEY FREESTYLE)
  AGE = *7..30
  DISTANCE = [25,50,100,200,400,800,1500]
  YEAR = (30.years.ago.year..Time.new.year).to_a

  M = %w(00 01 02 03 04 05 06 07 08 09)
  MINUTES = M + (10...60).to_a
  SECONDS =  M + (10...60).to_a
  MILLI_SECONDS =  M + (10...100).to_a
  belongs_to :swimmer
  validates :venue,:date, presence: true
  attr_accessor :minutes, :seconds, :milli_seconds
  before_save :insert_into_times
  before_save :calculate_age

  scope :stroke, lambda {|stroke| where(stroke: stroke)}
  scope :distance, lambda {|distance| where(distance: "#{distance}")}
  scope :date, lambda {|year| where('extract(year from date) = ?',"#{year}")}
  scope :swimmer, lambda {|swimmer| where(swimmer: swimmer)}
  scope :age, lambda {|age| where(age: age)}



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
  def times_in_seconds
    min = self.times/600
    sec = (self.times % 600) / 60
    min * 60 + sec
  end




  def insert_into_times
    times = self.minutes.to_i*600 + self.seconds.to_i*100 + milli_seconds.to_i
    self.times = times
  end

  def calculate_age
    self.age = self.date.year - self.swimmer.date_of_birth.year
  end

  def self.go

    SwimmerTime.all.group(:stroke).first

  end

  def self.best_times gender

    a = SwimmerTime.swimmer(Swimmer.where(sex: gender)).order(:times).group_by{|e|[e.stroke,e.distance,e.age]}

  end


end
