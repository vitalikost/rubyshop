class ProductController < ApplicationController
  def index
    @category_filter = params[:category_id]
    if @category_filter
      @products = Product.all.where(category_id: @category_filter)
    else
      @products = Product.all
    end

    if params[:search]
      @products=Product.where('name ILIKE ? or description ILIKE ?', "%#{params[:search]}%","%#{params[:search]}%")
    end

    @categories = Category.all.order(:position)
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
