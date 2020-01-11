class ProductsController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :release_sns_id
  before_action :login, except: [:index,:show]

  def release_sns_id
    session[:sns_id] = nil
  end

  # 商品一覧
  def index
    @ladys = Product.where(category_id: 1..198).limit(10).order('created_at DESC')
    @mens = Product.where(category_id: 199..344).limit(10).order('created_at DESC')
    @homeappliances = Product.where(category_id: 894..979).limit(10).order('created_at DESC')
    @amuses = Product.where(category_id: 681..793).limit(10).order('created_at DESC')

  end

  # 商品詳細
  def show
    @product = Product.find(params[:id])
    @product_images = ProductImage.where(product_id: params[:id])
    @exproduct = UsersExhibit.find_by(product_id: @product.id)
    @exuser = User.find(@exproduct.user_id)
    @exuser_products = UsersExhibit.where(user_id: @exproduct.user_id)
    @userproducts = @exuser.ex_products.where.not(id: @product.id).limit(6).order('created_at DESC')
    @grandchaild_category = Category.find(@product.category_id)
    @chaild_category = @grandchaild_category.parent
    @category = @chaild_category.parent

    @samecategory = Product.where(category_id: @grandchaild_category.id)
    @othercategory = @samecategory.where.not(id: @product.id).limit(6).order('created_at DESC')
  end
 
  # 商品出品
  def new

    @product=Product.new
    @product.product_images.build

    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("---")

  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  # 商品出品
  def create
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("---")

    @product = Product.new(products_params)
    if @product.save
      UsersExhibit.create(
        product_id:@product.id,
        user_id:current_user.id,
        product_status_id:1
      )
      redirect_to root_path
    else 
      render action: :new
    end
    
  end

  # 商品編集
  def edit
  end

  # 商品編集画面へのパス
  def edit_select
  end

  # 商品編集
  def update
  end

  # 商品詳細
  def itemshow
  end

  # 商品購入確認
  def buy
    @product = Product.find(params[:product_id])
    @product_images = ProductImage.where(product_id: params[:product_id])
    @address = Address.find_by(user_id: current_user.id)

    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  def purchase
    price = Product.find(params[:product_id]).price
    binding.pry
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => price, #支払金額を入力（itemテーブル等に紐づけても良い）
      :customer => card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
    )
    redirect_to action: 'pay_finish' #完了画面に移動
  end

  # 商品購入完了
  def pay_finish
    @product = Product.find(params[:product_id])
    @product_images = ProductImage.where(product_id: params[:product_id])
    @address = Address.find_by(user_id: current_user.id)

    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  private

  def products_params
    @category=Category.find_by(name:params[:category_id])
    params.require(:product).permit(:name,:description,:price,:shipping_charge,:shipping_method,:shipping_origin,:shipping_day,:product_condition,product_images_attributes:[:image_url]).merge(category_id:@category.id)
  end

end

