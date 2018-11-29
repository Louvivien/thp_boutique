class KittyController < ApplicationController

  skip_before_action :verify_authenticity_token

	
  def duplicate(product)
	  x = 0
	  Item.all.each do |items|
		if (items.title == product.title)
			x = x + 1
		end
	  end

	  if (x >= 2 && product.id > 20)
		  return true
	  else
		  return false
	  end
  end

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

  #def create
  # @item = Item.find(@@num)
  # current_user.panier.items << @item
  # puts 'coucou'
  # redirect_to '/'
  # end
	
  def new
	  @array = Array.new
	  Item.all.each do |item|
		  if (duplicate(item) == false)
			  @array << item
		  end
	  end
	  @item2 = Item.all
  end

  def product
	i = 0

	while(i < params[:number].to_i)
		put_item = Item.find(params[:id].to_i)
		put_item_duplicate = put_item.dup
		current_user.panier.items << put_item_duplicate
		i = i + 1
	end
	redirect_to '/index'
  end

  def panier
	@price = 0
    if (current_user == nil)
      flash[:notice] = "Connectez-vous pour voir votre panier"
    else
	  if (current_user.panier == nil)
	    flash[:notice] = "votre panier est vide"
	  else current_user.panier.items.each do |items|
		  items.price.sub!(",", ".")
		  prix = items.price.to_f
		  @price = @price + prix
		  @price
	    end
	  end
	end
  end
  
  def items
	  current_user.panier.items.delete(params[:id].to_i)
	  redirect_to '/panier'
  end

  def order
	  current_user.orders << Order.new
	  order = current_user.orders.last
	  panier = current_user.panier.items
	  panier.each do |item|
		  order.items << item
		  current_user.panier.items.delete(item.id)
	  end
	  redirect_to '/'
  end
end
