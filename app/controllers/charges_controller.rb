class ChargesController < ApplicationController
def new
  @amount = amount_global
end

def create
  # Amount in cents
  @amount = amount_global

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'eur'
  )
  
  destroy_shopping_cart

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

  private

  def destroy_shopping_cart
    @current_user = User.find(current_user.id)
    @shopping_cart = current_user.panier.items

    @shopping_cart.each do |item|
      item.delete
    end
  end

  def price_global
    @current_user = User.find(current_user.id)
    @price_total = 0
    @current_user.orders.last.items.each do |items|
      items.price.sub!(",", ".")
      price_of_product = items.price.to_f
      @price_total = @price_total + price_of_product
    end
    return @price_total
  end
  
  def amount_global
    @amount = price_global * 100
    @amount = @amount.to_i
    return @amount
  end

end
