class LikesController < ApplicationController
  before_action :set_product

  def create
    @like = current_user.likes.build(product_id: params[:product_id])
    @like.save
  end

  def destroy
    @like = Like.find_by(product_id: params[:product_id], user_id: current_user.id)
    @like.destroy
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
