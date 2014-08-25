class SwimmingRecord < ActiveRecord::Base
  validate :first_name,:last_name,:date_of_birth,:gender,:stroke,:distance,:level,:meet,:venue,:time,:date,:region,:region_code,:age,:information, presence: true
  before_save :convert_date_format
  def self.import_times file
    CSV.foreach(file.path, headers: true) do |row|

      line = row.to_s
      # puts line

      if( line[0] != ',' )
        if (line.include?'Page' and line.include? '/')
          @info = nil

        elsif (line.include? 'SPORTSYSTEMS')
          # @info = nil
        else
          m = line.gsub(/\,+/,',').gsub(/\s+/,' ').split(',')
          @first_name = m[0].split(' ')[0]
          @last_name = m[0].split(' ')[1]
          @date_of_birth = m[1]
          @region = m[2]
          @region_code = m[3]
        end
      else

        if line[0..4] == ',,,,,'
          @info ||= ''
          @info += "#{line.gsub(/\,+/,',').gsub(/\s+/,' ').split(',')[1]}\n"

        elsif line[0..2] == ',,,'

        elsif (line[0] == ',' and line[1].to_i == 0)
          record = line.gsub(/\,+/,',')
          @temp,@data = record.split(',')
          @data = @data.split(' ')
          @gender = @data[0]
          @distance = @data[1]
          @stroke = @data[2]
          @stroke += " #{@data[3]}" if @data.size == 4
        else
          record = line.gsub(/\,+/,',')
          @temp,@temp,@date,@meet,@venue,@level,@time = record.split(',')
          @meet = @meet.gsub(/\s\s+/,'')
          @venue = @venue.gsub(/\s\s+/,'')
          swimming_record = SwimmingRecord.where( first_name: @first_name,last_name: @last_name,gender: @gender, date_of_birth: @date_of_birth,stroke: @stroke, distance: @distance.to_i, level: @level, meet: @meet, venue: @venue, time: (SwimmingRecord.convert_time_into_mil_seconds @time),date: @date, region: @region, region_code: @region_code,information: @info,age: SwimmingRecord.calculate_age,)

          SwimmingRecord.create( first_name: @first_name,last_name: @last_name,gender: @gender, date_of_birth: @date_of_birth,stroke: @stroke, distance: @distance.to_i, level: @level, meet: @meet, venue: @venue, time: (SwimmingRecord.convert_time_into_mil_seconds @time),date: @date, region: @region, region_code: @region_code,information: @info,age: SwimmingRecord.calculate_age,) if swimming_record.empty?

        end
      end
    end
    @info = nil
  end


  def self.convert_time_into_mil_seconds time
    time = time.gsub(/\./,':').split(':').to_a
    time = (time[0].to_i * (6000)) + (time[1].to_i * 100) + (time[2].to_i)

  end

  def convert_times_into_string_format
    min = self.time/6000
    sec = (self.time % 6000 )/ 100
    milli_sec = ((self.time % 6000) % 100)

    "#{min}:#{sec}:#{milli_sec}"
  end

  def self.calculate_age
    @date.to_date.year - @date_of_birth.to_date.year
  end


  def self.search (first_name, last_name)

    SwimmingRecord.where("first_name LIKE ? AND last_name like ?", "%#{first_name.downcase.capitalize}%", "%#{last_name.downcase.capitalize}%")

  end

  def combined_name
    "#{self.first_name} #{self.last_name}"
  end

  def times_in_seconds
    time / 100
  end

  def self.synchronise_club_times

    SwimmingRecord.all.each do |record|

      s = Swimmer.joins(:user).where(users: {first_name: 'Shem',last_name: 'Fair'}).where(date_of_birth: record.date_of_birth, sex: record.gender)
      next if s.empty?
      puts record.time

      swimmer_time = SwimmerTime.joins(:swimmer).where(swimmer: s).where(date: record.date,course: record.course_type, times: record.time )
      if swimmer_time.empty?
        swimmer_time = SwimmerTime.new(swimmer: s.first, stroke: record.stroke, distance: record.distance, times: record.time, meet: record.meet,venue: record.venue,date: record.date,course: record.course_type)
        SwimmerTime.skip_callback(:save, :before, :insert_into_times)
        swimmer_time.save


      end
    end
  end

  def course_type
    if self.information.include? 'Short Course'
      'Short Course'
    else
      'Long Course'
    end
  end

  def self.filter_swimming_records records, condition
    records.where("information LIKE ?", "%#{condition}%")

  end

  def convert_date_format
    self.date = self.date.strftime('%Y/%m/%d')
    self.date_of_birth = self.date_of_birth.strftime('%Y/%m/%d')
  end

end

