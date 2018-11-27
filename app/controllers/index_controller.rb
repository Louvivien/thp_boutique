class IndexController < ApplicationController
	def index
		@item = Item.all
	end

end
