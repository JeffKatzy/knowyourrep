class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

def new
end


def create
    
  user = User.find_by(email: params[:user][:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to user_path(session[:user_id])
  else
    flash.now[:message] = 'Please enter the correct password'
    render 'new'
  end
end


def destroy
  session[:user_id] = nil
  redirect_to login_path
end

end