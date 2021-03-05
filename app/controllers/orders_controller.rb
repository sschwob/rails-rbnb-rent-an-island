class OrdersController < ApplicationController
  def create
  island = Island.find(params[:island_id])
  order  = Order.create!(island: island, amount: island.price_per_day, state: 'pending', user: current_user)
session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: island.name,
      images: [island.photos],
      amount: island.price_per_day_cents,
      currency: 'usd',
      quantity: 1
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
  )

  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

end
