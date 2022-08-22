class ApplicationController < ActionController::Base
  helper_method :current_cart

  private
  def current_cart
    @_cart ||= Cart.from_hash(session[:cart999])
  end
end
