class Post < ActiveRecord::Base

	attr_accessible :name, :description, :location, :cost, :size, :url, :weight, :category, :owner
	validates :name, :presence => true

end
