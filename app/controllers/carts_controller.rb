class CartsController < ApplicationController
  def show
  end

  def destroy
    session[:cart999] = nil
    redirect_to products_path, notice: "已清空"
  end
end
