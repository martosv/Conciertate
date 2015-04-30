class Concert < ActiveRecord::Base
	
	validates :band, :venue, :city, :date, :price, :photo, :description, :tickets, presence: true
end

