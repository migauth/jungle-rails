class UsersController < ApplicationController
  def index
    @users = Users.all
  end
 
   def new
     @user = User.new
   end
 
   def create
     @user = User.new(user_params)
   
     if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User created!'
     else
       render :new
     end
   end
   
 
   def destroy
   
   end
 
   private
 
   def user_params
     params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
   end
end
