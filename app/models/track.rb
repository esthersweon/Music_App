class Track < ActiveRecord::Base
	belongs_to :album
	has_one :band, through: :album, source: :band

	validates :album_id, :name, :lyrics, :ord, presence: true
	validates :bonus, inclusion: {in: [true, false]}
	validates :ord, uniqueness: {scope: :album_id}
end
