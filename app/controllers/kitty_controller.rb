class KittyController < ApplicationController

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
	puts 'coucou'
	redirect_to '/'
  end
	
  def new
	@item2 = Item.all
  end

  def panier
	@price = 0
	current_user.panier.items.each do |items|
      prix = items.price.to_f
	  @price = @price + prix
	end
  end
  
  def items
	current_user.panier.items.delete(params[:id].to_i)
  end
end
