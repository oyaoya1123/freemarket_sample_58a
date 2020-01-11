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
    binding.pry
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

  # 商品編集画面へのパス
  def edit_select
  end

  # 商品編集
  def edit
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("---")

    # binding.pry
    @product=Product.find_by(id: params[:id])
    @product_images_min=ProductImage.where(product_id: params[:id])
    # @select_glandchild_category=Category.find_by(id: @product.category_id)
    # @select_child_category=@select_glandchild_category.parent
    # @select_parent_category=@select_child_category.parent
    @category_child_array = @product.category.parent.parent.children
    @category_grandchild_array = @product.category.parent.children
  end

  # 商品編集
  def update
    @product=Product.find_by(id: params[:id])
    if @product.update(products_update_params)
      redirect_to root_path, notice: '商品を更新しました'
    else
      render :edit
    end

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

  def products_update_params
    binding.pry
    params.require(:product).permit(:name,:description,:price,:shipping_charge,:shipping_method,:shipping_origin,:shipping_day,:product_condition,:category_id, product_images_attributes:[:id, :image_url, :_destroy])
    # binding.pry
  end

end

