class User < ApplicationRecord
	def self.search(search)
		if search
	        User.where("name LIKE '%#{search}%'")
	    else
	        User.all
	    end
	end
	include UserCon
end

