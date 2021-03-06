class OrderController < ApplicationController
  def show
    @order = Order.new
  end

  def create
    @cart = init_cart
    @order = Order.new(order_params)
    if @order.save
      @cart.line_items.each do |product|
        @line = @order.item_orders.build(product_id: product.product_id, quantity:product.quantity)
        @line.save
      end
      @cart.destroy
      #UserMailer.email_user(@order).deliver_later
      #UserMailer.email_admin(@order).deliver_later
    end
    redirect_to root_path
  end

  private
  def order_params
    params.require(:order).permit(:name, :phone, :email, :comment)
  end

end
