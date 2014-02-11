module ApplicationHelper
  def signin_with_yammer_path
    "https://www.yammer.com/dialog/oauth?client_id=#{ENV['YAMMER_KEY']}&redirect_uri=http://#{request.raw_host_with_port}/auth/yammer/callback"
  end
end
