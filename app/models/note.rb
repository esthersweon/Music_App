class Note < ActiveRecord::Base
	belongs_to :user
	belongs_to :track

	validates :user, :track, presence: true
end
