# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_cart

  private

  def current_cart
    @current_cart ||= Cart.from_hash(session[:cart999])
  end
end
