class OrderController < ApplicationController
  def show
    @order = Order.new
  end

  def create
    @cart = init_cart
    @order = Order.new(question_params)
    if @order.save
      @cart.line_items.each do |product|
        @line = @order.item_orders.build(product_id: product.product_id, quantity:product.quantity)
        @line.save
      end
      @cart.destroy
    end
    redirect_to root_path
  end

  private
  def question_params
    params.require(:order).permit(:name, :phone)
  end

end
