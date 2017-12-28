class CartController < ApplicationController
  def add
    @cart = init_cart
    @product = Product.find(params[:id])
    
    @line_item = @cart.line_items.build(product: @product, quantity:1)
    @line_item.save
    reditect_to product_path
    end
  end

  def remove
  end

end
