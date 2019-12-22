class ProductsController < ApplicationController
  # 商品一覧
  def index

    @category_children1 = Category.cat1
    @category_children2 = Category.cat2
    @category_children3 = Category.cat3
    @category_children4 = Category.cat4
    @category_children5 = Category.cat5
    @category_children6 = Category.cat6
    @category_children7 = Category.cat7
    @category_children8 = Category.cat8
    @category_children9 = Category.cat9
    @category_children10 = Category.cat10
    @category_children11 = Category.cat11
    @category_children12 = Category.cat12
    @category_children13 = Category.cat13

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
