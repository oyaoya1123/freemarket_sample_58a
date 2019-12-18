class ProductsController < ApplicationController
  # 商品一覧
  def index
  end

  # 商品出品
  def create
  end

  # 商品詳細
  def itemshow
  end

  # 商品購入確認
  def buy
  end

  def exhibit_test
    @user1 = User.find(1)
    @product1 = Product.find(1)
  end
end
