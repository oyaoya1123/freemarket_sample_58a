class ProductsController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :release_sns_id
  before_action :login, except: [:index,:show]
  before_action :set_card, only: [:buy, :purchase, :pay_finish]
  before_action :find_product, only: [:show,:destroy,:edit_select]
  before_action :url_protect, only: [:edit]
  before_action :result, only: [:index, :show, :category_list, :edit_select]
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

  def get_size
    size_category = Category.find("#{params[:grandchild_id]}")
    @sizes = Size.where(size_category: size_category.size_category)
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
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("---")

    @product=Product.find(params[:id])
    @product_images_min=ProductImage.where(product_id: params[:id])
    @category_child_array = @product.category.parent.parent.children
    @category_grandchild_array = @product.category.parent.children

    size_category = Category.find(@product.category_id).size_category
    @sizes = Size.where(size_category: size_category)

  end

  # 商品編集画面へのパス
  def edit_select
    @product=Product.find(params[:id])
    @product_images = ProductImage.where(product_id: params[:id])
    @exproduct = UsersExhibit.find_by(product_id: @product.id)
    @exuser = User.find(@exproduct.user_id)
    @grandchaild_category = Category.find(@product.category_id)
    @chaild_category = @grandchaild_category.parent
    @category = @chaild_category.parent
  end


  # 商品編集
  def update
    @product=Product.find(params[:id])
    if @product.update(products_update_params)
      redirect_to root_path
    else
      redirect_to edit_product_path(@product)
    end
  end

  #商品削除
  def destroy
    @exproduct = UsersExhibit.find_by(product_id: @product.id)
    if @exproduct.user_id == current_user.id && @product.destroy
      redirect_to products_path
    else
      render :edit_select
    end

  end


  # 商品購入確認
  def buy
    @product = Product.find(params[:product_id])
    @product_images = ProductImage.where(product_id: params[:product_id])
    @address = Address.find_by(user_id: current_user.id)

    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def purchase
    price = Product.find(params[:product_id]).price
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: price, #支払金額を入力（itemテーブル等に紐づけても良い）
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
    )
    
    # ステータスの更新
    @product = Product.find(params[:product_id])
    UsersPurchase.create(
      product_id:@product.id,
      user_id:current_user.id,
      product_status_id:2
    )
    @ex_status=UsersExhibit.find_by(product_id: @product.id)
    @ex_status.update(
      product_id:@product.id,
      user_id:current_user.id,
      product_status_id:2
    )
    redirect_to action: 'pay_finish' #完了画面に移動
  end

  # 商品購入完了
  def pay_finish
    @product = Product.find(params[:product_id])
    @product_images = ProductImage.where(product_id: params[:product_id])
    @address = Address.find_by(user_id: current_user.id)

    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  # カテゴリー一覧
  def category_list
    @category = Category.find(params[:id])
    @child_categorys = @category.children
    @grandchild_categorys = @child_categorys.map {|child_category| child_category.children} 
    @child_categorys_ids = @child_categorys.map {|child_category| child_category.id}
    
    @grandchild_categorys_ids = []

    if @grandchild_categorys != []

      @grandchild_categorys.each do |grandchild_category|
        grandchild_category.each do |category|
          @grandchild_categorys_ids << category.id
        end
      end
    end

    if @grandchild_categorys_ids != []
      @grandchild_products = Product.where(category_id: @grandchild_categorys_ids)
    elsif @child_categorys != []
      @grandchild_products = Product.where(category_id: @child_categorys_ids)
    else
      @grandchild_products = Product.where(category_id: @category.id)
    end
  end


  private

  def find_product
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:size,:name,:description,:price,:shipping_charge,:shipping_method,:shipping_origin,:shipping_day,:product_condition,:category_id,product_images_attributes:[:image_url])
  end

  def products_update_params
    params.require(:product).permit(:size,:name,:description,:price,:shipping_charge,:shipping_method,:shipping_origin,:shipping_day,:product_condition,:category_id,product_images_attributes:[:id, :image_url, :_destroy])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def url_protect
    @product=Product.find(params[:id])
    unless user_signed_in? && @product.ex_user.id==current_user.id
      redirect_to products_path
    end
  end
end

