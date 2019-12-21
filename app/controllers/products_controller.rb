class ProductsController < ApplicationController
  # 商品一覧
  def index
    @categorys = Category2.all.where(ancestry:nil)
    # @categorys.each do|parent|
    #   p[]>>parent
    #   @category_children1 = Category2.where(ancestry:1)
    #   @category_children2 = Category2.where(ancestry:794)
    #   @category_children3 = Category2.where(ancestry:1)
    #   @category_children4 = Category2.where(ancestry:1)
    #   @category_children5 = Category2.where(ancestry:1)
    #   @category_children6 = Category2.where(ancestry:1)
    #   @category_children7 = Category2.where(ancestry:1)
    #   @category_children8 = Category2.where(ancestry:1)
    #   @category_children9 = Category2.where(ancestry:1)
    #   @category_children10 = Category2.where(ancestry:1)
    #   @category_children11 = Category2.where(ancestry:1)
    #   @category_children12 = Category2.where(ancestry:1)
    #   @category_children13 = Category2.where(ancestry:1)
    # end

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
    @childrens=Category2.find("1141").children
    @gchildrens=@childrens.find("1142").children

  end
end
