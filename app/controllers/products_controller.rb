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
  
  end

  # 商品出品
  def create
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
  
end

