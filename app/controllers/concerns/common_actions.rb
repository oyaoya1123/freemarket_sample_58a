module CommonActions
   extend ActiveSupport::Concern
 
   def set_categories
    @categories=Category.roots
   end

   def login
    redirect_to users_login_path unless user_signed_in?
   end

   def result
    @search =  Product.ransack(params[:q])
    @results = @search.result(distinct: true)
    @count = @results.count
    @products = Product.order(created_at: :desc).limit(24)
  end

 end