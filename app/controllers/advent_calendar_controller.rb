class AdventCalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    event = Event.find(params[:event_id])

    @shown_month = Date.civil(@year, @month)

    strip_start, strip_end = Entry.get_start_and_end_dates(@shown_month)

    @event_strips = Entry.create_event_strips(strip_start, strip_end, [event])
  end
  
end
