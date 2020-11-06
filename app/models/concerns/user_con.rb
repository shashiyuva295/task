module UserCon
	extend ActiveSupport::Concern

	included do
		before_create do
		  self.name = name.capitalize
		end

		validates :name,:age, :subject, presence: true
	end
end

# def self.search(search)
#   if search
#     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
#   else
#     find(:all)
#   end
# end

# def self.search(search)
# 	if search
# 		User.where(['name LIKE ? OR subject LIKE ?',"%#{search}%","%#{search}%"])
# 	else
# 		User.all
#   	end
# end

