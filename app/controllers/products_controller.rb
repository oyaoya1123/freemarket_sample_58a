class ProductsController < ApplicationController
  # 商品一覧
  def index
  end

  def new
    @product=Product.new
    # @image=Product_image.new
  end

  # 商品出品
  def create
    # @image=Product_image.create(params[:image_url])
    @product = Product.create(product_create_params)
    render :new
  end

  # 商品詳細
  def itemshow
  end

  # 商品購入確認
  def buy
  end

  def product_create_params
    params.require(:prodact).permit(:name,:description,:price,images_attributes:[:image_url])
  end
  
end
