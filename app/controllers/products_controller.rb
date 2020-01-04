class ProductsController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :release_sns_id

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
    @grandchaild_category = Category.find(@product.category_id)
    @chaild_category = @grandchaild_category.parent
    @category = @chaild_category.parent
  end
 
  # 商品出品
  def new

    @product=Product.new
    10.times{@product.product_images.build}

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

  # 商品購入確認
  def buy
  end

  private

  def products_params
    @category=Category.find_by(name:params[:category_id])
    params.require(:product).permit(:name,:description,:price,:shipping_charge,:shipping_method,:shipping_origin,:shipping_day,:product_condition,product_images_attributes:[:image_url]).merge(category_id:@category.id)
  end

end

