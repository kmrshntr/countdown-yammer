class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_by(email:auth['info']['email'])
    user.name = auth['info']['nickname']
    user.save
    session[:user_id] = user.id
    redirect_to root_path, :notice => "Hello #{user.name}."
  end

  def destroy
	reset_session
    redirect_to root_path, :notice => "You successfully logged out."
  end
end
