class ProductsController < ApplicationController
  # 商品一覧
  def index
    @categorys = Category.all.where(ancestry:nil)
    @category_children1 = Category.where(ancestry:1)
    @category_children2 = Category.where(ancestry:199)
    @category_children3 = Category.where(ancestry:345)
    @category_children4 = Category.where(ancestry:480)
    @category_children5 = Category.where(ancestry:622)
    @category_children6 = Category.where(ancestry:681)
    @category_children7 = Category.where(ancestry:794)
    @category_children8 = Category.where(ancestry:894)
    @category_children9 = Category.where(ancestry:980)
    @category_children10 = Category.where(ancestry:1089)
    @category_children11 = Category.where(ancestry:1141)
    @category_children12 = Category.where(ancestry:1201)
    @category_children13 = Category.where(ancestry:1264)

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
  
end
