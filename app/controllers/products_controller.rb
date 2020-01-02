class ProductsController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :release_sns_id

  def release_sns_id
    session[:sns_id] = nil
  end

  # 商品一覧
  def index
  @products = Product.all
  end

  # 商品詳細
  def show
    @products = Product.find(params[:id])
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

