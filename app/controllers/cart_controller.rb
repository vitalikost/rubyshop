class CartController < ApplicationController
  def add
    @cart = init_cart
    @product = Product.find(params[:id])
    @line_item = @cart.line_items.find_by(product_id: @product)
      if @line_item
        @line_item.quantity += 1
      else
        @line_item = @cart.line_items.build(product: @product, quantity:1)
      end
      @line_item.save
    redirect_to root_path
  end


  def remove

    @cart = init_cart
    @product = Product.find(params[:id])
    @line_item = @cart.line_items.find_by(product_id: @product)
    if @line_item
      @line_item.destroy
    end
    redirect_to root_path
  end


  def remove_one

    @cart = init_cart
    @product = Product.find(params[:id])
    @line_item = @cart.line_items.find_by(product_id: @product)
    if @line_item
      @line_item.quantity -= 1
      @line_item.save
    end
    if @line_item.quantity == 0
      @line_item.destroy
    end
    redirect_to root_path
  end



end
