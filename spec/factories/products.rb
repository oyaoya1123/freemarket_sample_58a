FactoryBot.define do

  factory :product do
    name              {"abe"}
    description                 {"あああああああああああああああ"}
    price              {"1000"}
    shipping_origin {"北海道"}
    shipping_method {"らくらくメルカリ便"}
    shipping_charge {"送料込み(出品者負担)"}
    shipping_day {"2~3日で発送"}
    product_condition {"新品・未使用"}
    category_id {"4"}
    after(:build) do |product|
      product.product_images<< build(:product_image, product: product)
    end
  end

  factory :product_no_picture ,class: Product do
    name              {"abe"}
    description                 {"あああああああああああああああ"}
    price              {"1000"}
    shipping_origin {"北海道"}
    shipping_method {"らくらくメルカリ便"}
    shipping_charge {"送料込み(出品者負担)"}
    shipping_day {"2~3日で発送"}
    product_condition {"新品・未使用"}
    category_id {"4"}

  end

  factory :product_11_picture ,class: Product do
    name              {"abe"}
    description                 {"あああああああああああああああ"}
    price              {"1000"}
    shipping_origin {"北海道"}
    shipping_method {"らくらくメルカリ便"}
    shipping_charge {"送料込み(出品者負担)"}
    shipping_day {"2~3日で発送"}
    product_condition {"新品・未使用"}
    category_id {"4"}
    after(:build) do |product|
      product.product_images<< build(:product_image, product: product)
      product.product_images<< build(:product_image, product: product)
      product.product_images<< build(:product_image, product: product)
      product.product_images<< build(:product_image, product: product)
      product.product_images<< build(:product_image, product: product)
      product.product_images<< build(:product_image, product: product)
      product.product_images<< build(:product_image, product: product)
      product.product_images<< build(:product_image, product: product)
      product.product_images<< build(:product_image, product: product)
      product.product_images<< build(:product_image, product: product)
      product.product_images<< build(:product_image, product: product)
    end

  end

end