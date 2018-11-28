class KittyController < ApplicationController
	@@num = 0

	def index
		if current_user && current_user.panier == nil
			current_user.panier = Panier.new
		end
    end
	
	 def show
		 @@num = params[:id].to_i
                 @item = Item.find(params[:id].to_i)
                 if current_user
                 @current_user = User.find(current_user.id)
                 end
        end

	 def create
		@item = Item.find(@@num)
		current_user.panier.items << @item
		redirect_to '/'
	 end

    def new
    	@item2 = Item.all
    end

    def addpanier
    	@item = Item.find(@@num)
		current_user.panier.items << @item
		p "ajout au panier"
    end

end
