class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CartsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ".must_login"
      redirect_to login_url
    end
  end

  def create_cart
    unless @cart.present?
      @cart = Cart.build_cart session[:cart]
    end
  end

  def update_cart
    session[:cart] = @cart
  end
end
