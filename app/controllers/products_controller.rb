class ProductsController < ApplicationController
  # 商品一覧
  def index
    @parents = Category2.all.where(ancestry:nil).limit(13)
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

  
  #テスト
  def a
    @parents = Category2.all.where(ancestry:nil)
    @childrens=Category2.find("1141")

  end
end
