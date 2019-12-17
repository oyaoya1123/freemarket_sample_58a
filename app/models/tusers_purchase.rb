class TusersPurchase < ApplicationRecord
  belongs_to :tuser
  belongs_to :tproduct
end
