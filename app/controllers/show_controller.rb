class ShowController < ApplicationController
	def show
		 @item = Item.find(params[:id].to_i)
	end
end
