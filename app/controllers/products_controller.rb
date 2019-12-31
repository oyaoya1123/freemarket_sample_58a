class ProductsController < ApplicationController
  # 商品一覧
  def index
    @categories=Category.roots

  end

  # 商品詳細
  def show
  end
 
  # 商品出品
  def new
    @product = Product.new
  end

  # 商品出品
  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to "/"
    else 
      render new
    end
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

  private

  def products_params
    params.require(:product).permit(:name,:description,:price,:shipping_charge,:shipping_method,:shipping_origin,:shipping_day,:product_condition)
  end

end

