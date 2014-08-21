class SwimmingRecord < ActiveRecord::Base
  validate :first_name,:last_name,:date_of_birth,:gender,:stroke,:distance,:level,:meet,:venue,:time,:date,:region,:region_code,:age,:information, presence: true

  def self.import_times file
    CSV.foreach(file.path, headers: true) do |row|
      file.save

      line = row.to_s
      puts line

      if( line[0] != ',' )
        if (line.include?'Page' and line.include? '/')
          @info = nil

        elsif (line.include? 'SPORTSYSTEMS')

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
          SwimmingRecord.create( first_name: @first_name,last_name: @last_name,gender: @gender, date_of_birth: @date_of_birth,stroke: @stroke, distance: @distance.to_i, level: @level, meet: @meet, venue: @venue, time: (SwimmingRecord.convert_time_into_mil_seconds @time),date: @date, region: @region, region_code: @region_code,information: @info,age: SwimmingRecord.calculate_age,)
        end
      end
    end
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


end
