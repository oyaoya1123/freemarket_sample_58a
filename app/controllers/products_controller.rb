class ProductsController < ApplicationController
  # 商品一覧
  def index
    @categories=Category.all
    # @category=find(id: params[id])
    # @categories = Category.where(params[:id])
    # [].each do ||

    # end
    @category_children1 = Category.cat(1)
    @category_children2 = Category.cat(2)
    @category_children3 = Category.cat(3)
    @category_children4 = Category.cat(4)
    @category_children5 = Category.cat(5)
    @category_children6 = Category.cat(6)
    @category_children7 = Category.cat(7)
    @category_children8 = Category.cat(8)
    @category_children9 = Category.cat(9)
    @category_children10 = Category.cat(10)
    @category_children11 = Category.cat(11)
    @category_children12 = Category.cat(12)
    @category_children13 = Category.cat(13)
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
