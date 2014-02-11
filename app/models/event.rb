require 'yammer'
class Event < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  validates :name, presence: true
  validates :date, presence: true

  after_find :set_date

  def self.post_to_yammer
     self.all.order(:created_at).each do |event|
       client = Yammer::Client.new(:access_token  => event.owner.token)
       days = (event.date - Time.now.utc.beginning_of_day).to_i / (60 * 60 * 24)
       client.create_message("#{days} days to #{event.name}.")
     end
  end

  def set_date
    self.date = self.date.strftime("%Y/%m/%d")
  end

end
