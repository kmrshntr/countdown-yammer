require 'yammer'

class Event < ActiveRecord::Base
  has_event_calendar
  
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  validates :name, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true

  def self.post_to_yammer
    self.all.order(:created_at).each do |event|
      client = Yammer::Client.new(:access_token  => event.owner.token)
      days = (event.start_at - Time.now.utc.beginning_of_day).to_i / (60 * 60 * 24)
      client.create_message("#{event.name}まであと#{days}日！")
    end
  end

end
