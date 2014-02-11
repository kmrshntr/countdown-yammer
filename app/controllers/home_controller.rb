class HomeController < ApplicationController
  skip_before_filter :authorize, :only => [:index]
  def index
    if current_user
      render 'events/index'
    else
      render 'welcome'
    end
  end
end
