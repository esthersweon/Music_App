# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  name       :string(255)      not null
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
	belongs_to :band
	has_many :tracks

	validates :band_id, :name, :year, presence:true
	validates :live, inclusion: {in: [true, false]}
	validates :name, uniqueness: {scope: :band_id}
	validates :year, numericality: {minimum: 1900, maximum: 3000}
end
