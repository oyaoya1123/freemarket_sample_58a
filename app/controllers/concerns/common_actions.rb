module CommonActions
   extend ActiveSupport::Concern
 
   def set_categories
    @categories=Category.roots
   end
 
 end