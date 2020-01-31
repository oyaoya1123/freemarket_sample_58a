class RatesController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :result, only: [:index, :new]

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
      @rate.rate_id=@product.ex_user.id
      @product.ex_status = ７
      @rate.save
      @product.save
      redirect_to new_product_rate_path
    elsif @product.ex_status==7 #評価待ち
      @rate=Rate.new(rate_params)
      @rate.rater_id=current_user.id
      @rate.rate_id=@product.pu_user.id
      @product.ex_status = 8
      @rate.save
      @product.save
      redirect_to new_product_rate_path
    end

  end

  private
    def rate_params
      params.permit(:rate,:message).merge(rater_id:current_user.id)
    end

end
