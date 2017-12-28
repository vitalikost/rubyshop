class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :init_cart

  def init_cart
    @cart = Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

end