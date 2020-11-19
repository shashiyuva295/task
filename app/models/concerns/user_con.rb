module UserCon
	extend ActiveSupport::Concern

	included do
	
		before_create do
		  self.name = name.capitalize
		end

		validates :name,:age, :subject, presence: true
	end
end