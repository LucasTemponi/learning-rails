class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def login
    @user = User.find_by(email: user_params[:email])

    if @user && @user.password == user_params[:password]
      session[:user_id] = @user.id
      cookies[:user] = @user[:email]
      flash[:notice] = 'Successfully logged in!'
      redirect_to('/')
    else
      render('new')
    end
  end

  def destroy
    cookies.delete(:user)
    session[:user_id] = nil
    redirect_to('/login')
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
