class Session < ActiveRecord::Base
    has_many :readings
    belongs_to :user
    def update_cached_values
        self.bpm_min = readings.minimum('bpm')
        self.bpm_max = readings.maximum('bpm')
        self.bpm_mean = readings.sum('bpm * duration') / readings.sum('duration')
        self.zone1_time = readings.where("bpm >= ? and bpm < ?",user.zone1_min,user.zone1_max).sum('duration')
        self.zone2_time = readings.where("bpm >= ? and bpm < ?",user.zone2_min,user.zone2_max).sum('duration')
        self.zone3_time = readings.where("bpm >= ? and bpm < ?",user.zone3_min,user.zone3_max).sum('duration')
        self.zone4_time = readings.where("bpm >= ? and bpm < ?",user.zone4_min,user.zone4_max).sum('duration')
        self.save
    end
end
