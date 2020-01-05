FactoryBot.define do

  factory :product_image, class: ProductImage do
    image_url        {File.open("#{Rails.root}/public/uploads/product_image/image_url/nezumi1.jpg")}
    association  :product, factory: :product
  end

end