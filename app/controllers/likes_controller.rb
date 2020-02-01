class LikesController < ApplicationController
  before_action :set_product

  def create
    # @like = current_user.likes.create(product_id: params[:product_id])
    @like = current_user.likes.build(product_id: params[:product_id])
    @like.save
    # @product.reload
    # like = {'user_id' => @like.user_id, 'product_id' => @like.product_id}
    # render json: like
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(product_id: params[:product_id], user_id: current_user.id)
    @like.destroy
    # like = {'user_id' => @like.user_id, 'product_id' => @like.product_id}
    # render json: like
    # @product.reload
    # redirect_back(fallback_location: root_path)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
