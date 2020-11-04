class UsersController < ApplicationController
	helper_method :sort_column, :sort_direction
	def index
		@users = User.all
		@users = User.order(sort_column + " " + sort_direction)
		
		#if params[:radio_input] == 'name'
			#@search = params["search"]
			#@search.present?
		  	#@name = @search["name"]
		  	#@users = User.where(title: @name)
		  	#@users = User.where("name LIKE OR  ?", "%#{@name}%")
		#else
			#@search = params["search"]
			#@subject = @search["subject"]
			#@users = User.where(title: @name)
			#@users = User.where("subject LIKE OR  ?", "%#{@subject}%")

		#end
		if params[:radio_input] == 'name'
			@users = User.search(params[:search])
		elsif params[:radio_input] == 'subject'
		 	@users = User.search(params[:search])
		 else
		 	User.all
		 end
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
	    	redirect_to @user
		else
	   		render 'new'
		end
	end	
	
	def update
		@user = User.find(params[:id])
	  	if @user.update(user_params)
	    	redirect_to @user
	  	else
	    	render 'edit'
	  	end
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
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