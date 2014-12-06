class User < ActiveRecord::Base
	def time_and_zone
    	[start_time, time_zone].join(' ')
  	end
end
