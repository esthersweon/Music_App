# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  name       :string(255)      not null
#  lyrics     :text             not null
#  ord        :integer          not null
#  bonus      :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
	belongs_to :album
	has_one :band, through: :album, source: :band
	has_many :notes

	validates :album, :name, :lyrics, :ord, presence: true
	validates :bonus, inclusion: {in: [true, false]}
	validates :ord, uniqueness: {scope: :album_id}
end
