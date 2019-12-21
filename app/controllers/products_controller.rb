class ProductsController < ApplicationController
  # 商品一覧
  def index
  end

  def new
    @product=Product.new
  end

  # 商品出品
  def create
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
    params.permit(:name,:description,:price)
  end
  
end
