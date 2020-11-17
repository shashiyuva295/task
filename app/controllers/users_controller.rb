class UsersController < ApplicationController
	helper_method :sort_column, :sort_direction
	
	def index
		@users = User.all
		@users = User.order(sort_column + " " + sort_direction)
		
		# if params[:search].present?
		# 	@users = User.search(params[:search])
		# end
		# if params[:name]
		# 	@user = User.where('name LIKE ?', "%{params[:name]}%")
		# else
		# 	@user = User.all
		# end
	

		#*** search ***#
		# if params[:radio_input] == 'name'
		# @search = params[:search]
		# 	if @search.present?
		# 		@users = User.where("name LIKE ? ", "%#{@search}%")
		# 	end
		# elsif params[:radio_input] == 'subject'
		# 	@search = params[:search]
		# 	if @search.present?
		#  		@users = User.where("subject LIKE   ?", "%#{@search}%")
		# 	end
		# else
		# 	User.all
		# end

	end
		
	def show
		@user = User.find(params[:id])	
	end
	
	def new
	  	@user = User.new
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash.notice = 'Student Added'
	    	redirect_to @user
		else
	   		render 'new'
		end

	end	
	
	def update
		@user = User.find(params[:id])
	  	if @user.update(user_params)
	  		flash.notice = 'Student Updated'
	    	redirect_to @user
	  	else
	    	render 'edit'
	  	end
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash.notice = 'Student Destroyed'
	  	redirect_to users_path
	end

private
    def user_params
      params.require(:user).permit(:name, :age,:subject)
    end

    def sort_column
        User.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
      
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end