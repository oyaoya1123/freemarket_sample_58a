class ProductsController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :release_sns_id

  def release_sns_id
    session[:sns_id] = nil
  end

  def indextest
  end

  # 商品一覧
  def index
    @ladys = Product.where(category_id: 1).limit(10).order('created_at DESC')
    @mens = Product.where(category_id: 2).limit(10).order('created_at DESC')
    @homeappliances = Product.where(category_id: 3).limit(10).order('created_at DESC')
    @amuses = Product.where(category_id: 4).limit(10).order('created_at DESC')
  end

  # 商品詳細
  def show
    @product = Product.find(params[:id])
    @product_images = ProductImage.where(product_id: params[:id])
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
      @product_image = ProductImage.create(product_id: @product.id, image_url: params[:product][:product_images_attributes]["0"][:image_url])
      
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
    params.require(:product).permit(:name,:description,:price,:shipping_charge,:shipping_method,:shipping_origin,:shipping_day,:product_condition,product_images_attributes:[:image_url])
  end

end

