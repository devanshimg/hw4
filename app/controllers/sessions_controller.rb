class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by({ "email" => params["email"] })

    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        # login the user
        session["user_id"] = @user["id"]
        redirect_to "/places"
      else
        redirect_to "/login"
      end
    else
      redirect_to "/login"
    end
  end
  

  def destroy
    flash["notice"] = "Goodbye!"
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  