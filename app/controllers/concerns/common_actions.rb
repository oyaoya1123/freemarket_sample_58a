module CommonActions
   extend ActiveSupport::Concern
 
   def set_categories
    @categories=Category.roots
   end

   def login
    redirect_to users_login_path
   end

 end