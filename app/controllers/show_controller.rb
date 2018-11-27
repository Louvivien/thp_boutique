class ShowController < ApplicationController
	def show
		 @item = Item.find(params[:id].to_i)
		 if current_user
		 @current_user = User.find(current_user.id)
		 end
	end
end
