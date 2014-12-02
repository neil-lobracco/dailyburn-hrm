class SessionsController < ApplicationController
    def index
        @sessions = Session.all.order('created_at desc').paginate(:page => params[:page], :per_page => 30).includes(:user)
        @stats = {
            :bpm_min => Session.minimum("bpm_min"),
            :bpm_max => Session.maximum("bpm_max"),
            :bpm_mean => Session.sum("duration * bpm_mean") / Session.sum("duration"),
            :zone1_time => Session.sum("zone1_time"),
            :zone2_time => Session.sum("zone2_time"),
            :zone3_time => Session.sum("zone3_time"),
            :zone4_time => Session.sum("zone4_time")
        }
        total_time = @stats[:zone1_time] + @stats[:zone2_time] + @stats[:zone3_time] + @stats[:zone4_time]  
        @stats[:zone1_pct] = @stats[:zone1_time] / total_time * 100
        @stats[:zone2_pct] = @stats[:zone2_time] / total_time * 100
        @stats[:zone3_pct] = @stats[:zone3_time] / total_time * 100
        @stats[:zone4_pct] = @stats[:zone4_time] / total_time * 100
    end
    def show
        @session = Session.find(params[:id])
        @chart_data = {}
        @session.readings.each do |reading|
            @chart_data[reading.start] = reading.bpm
        end
    end
end
