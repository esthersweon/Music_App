class Album < ActiveRecord::Base
	belongs_to :band
	has_many :tracks

	validates :band_id, :name, :year, presence:true
	validates :live, inclusion: {in: [true, false]}
	validates :name, uniqueness: {scope: :band_id}
	validates :year, numericality: {minimum: 1900, maximum: 3000}
end
