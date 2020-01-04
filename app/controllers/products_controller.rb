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

  end

  # 商品詳細
  def show

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

