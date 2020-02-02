class RatesController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :result, only: [:index, :new, :pu_user_rate]

  def index
  end

  def new
    @product=Product.find(params[:product_id])
    @rate = Rate.new
  end

  def pu_user_rate
    @product=Product.find(params[:product_id])
    if @product.ex_status==5 #発送待ち
      @product.ex_status = 6
      @product.save
      redirect_to new_product_rate_path(@product.id)
    elsif @product.ex_status==6 #受取評価待ち
      @rate=Rate.new(rate_params)
      # binding.pry
      @rate.rate_id=@product.ex_user.id
      @rate.rater_id=current_user.id
      # binding.pry
      if @rate.save
        @product.ex_status = 7
        @product.save
        redirect_to new_product_rate_path
      else
        render action: :new
      end
    elsif @product.ex_status==7 #評価待ち
      @rate=Rate.new(rate_params)
      @rate.rater_id=current_user.id
      @rate.rate_id=@product.pu_user.id
      @ex=UsersExhibit.find_by(product_id:@product.id)
      @pu=UsersPurchase.find_by(product_id:@product.id)
      @ex.product_status_id=3
      @pu.product_status_id=4
      if @rate.save
        @ex.save
        @pu.save
        @product.ex_status = 8
        @product.save
        redirect_to new_product_rate_path
      else
        render action: :new
      end

    end

  end

  private

    def rate_params
      params.permit(:ratenum,:message)
    end

end
