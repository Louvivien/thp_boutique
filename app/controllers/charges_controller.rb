class ChargesController < ApplicationController
def new
  @current_user = User.find(current_user.id)
  @price_total = 0
  @current_user.orders.last.items.each do |items|
    items.price.sub!(",", ".")
    prix = items.price.to_f
    @price_total = @price_total + prix
  end
  @amount = @price_total * 100
  @amount = @amount.to_i
end

def create
  # Amount in cents
  @current_user = User.find(current_user.id)
  @price_total = 0
  @current_user.orders.last.items.each do |items|
    items.price.sub!(",", ".")
    prix = items.price.to_f
    @price_total = @price_total + prix
  end
  puts @price_total.class 
  @amount = @price_total * 100
  @amount = @amount.to_i
  puts @amount
  puts @amount.class
  puts 'coucou'

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

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
end
