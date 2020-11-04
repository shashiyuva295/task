class ApplicationController < ActionController::Base
	helper_method :sort_column, :sort_direction
	before_action :authenticate_student! 
end
