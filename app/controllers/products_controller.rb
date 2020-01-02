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

  #商品購入
  def buy
    @product = Product.find(1)
  end

  # 商品購入確認
  def pay
    # binding.pry
    @product = Product.find(params[:product_id])
    Payjp.api_key = ENV['PAYJP_TEST_SECRET_KEY']
    Payjp::Charge.create(
    amount: @product.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end

  private

  def products_params
    params.require(:product).permit(:name,:description,:price,:shipping_charge,:shipping_method,:shipping_origin,:shipping_day,:product_condition,product_images_attributes:[:image_url])
  end

end

