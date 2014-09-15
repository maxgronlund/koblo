class CartsController < ApplicationController
  def destroy
    @cart.clear
    redirect_to songs_path
  end
end
