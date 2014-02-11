module ApplicationHelper
  def signin_with_yammer_path
    "https://www.yammer.com/dialog/oauth?client_id=#{ENV['YAMMER_KEY']}&redirect_uri=http://stark-atoll-3603.herokuapp.com"
  end
end
