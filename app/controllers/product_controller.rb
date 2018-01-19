class ProductController < ApplicationController
  def index
    @products = Product.all;
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, {images: []}, :category_id, {attribute_value_ids: []})
  end

end
