class ProductsController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :release_sns_id

  def release_sns_id
    session[:sns_id] = nil
  end

  # 商品一覧
  def index

  end

  # 商品詳細
  def show

  end
 
  # 商品出品
  def new
    @product=Product.new
    @product.product_images.build
  end

  # 商品出品
  def create

    @product = Product.new(product_create_params)
    @product.save

  end

  # 商品編集
  def edit
  end

  # 商品編集
  def update
  end

  # 商品詳細
  def itemshow
  end

  # 商品購入確認
  def buy
  end

  def product_create_params
   
    params.require(:product).permit(:name,:description,:price,product_images_attributes:[:image_url])
  end
  
end

