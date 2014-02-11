class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    render :text => auth[:credentials][:token]
  end

  def destroy
  end
end
