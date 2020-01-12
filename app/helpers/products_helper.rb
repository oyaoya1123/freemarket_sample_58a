module ProductsHelper

  require 'active_support/all'

  def converting_to_jpy(price)
    #"#{price.to_s(:delimited, delimiter: ',')}"
    "#{price}"
  end
  
  def expiration_date(month, year)
    #"#{month.to_s}" + " / " + "#{year.to_s.slice(2,3)}"
    "#{month}" + " / " + "#{year}"
  end
end
