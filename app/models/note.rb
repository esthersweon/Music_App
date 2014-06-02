class Note < ActiveRecord::Base
	belongs_to :user
	belongs_to :track

	validates :user_id, :track_id, presence:true
end
