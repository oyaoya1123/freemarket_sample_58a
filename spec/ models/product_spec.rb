require 'rails_helper'

describe Product do
  describe '#create' do
    # 1. 全項目が存在すれば登録できること
    it "is valid" do
      product = build(:product)
      expect(product).to be_valid
    end

    # 2. nameが空では登録できないこと
    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
     # 3. descriptionが空では登録できないこと
    it "is invalid without a description" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

     # 4. priceが空では登録できないこと
     it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

     # 5. shipping_originが空では登録できないこと
     it "is invalid without a shipping_origin" do
      product = build(:product, shipping_origin: nil)
      product.valid?
      expect(product.errors[:shipping_origin]).to include("を入力してください")
    end

     # 6. shipping_methodが空では登録できないこと
     it "is invalid without a shipping_origin" do
      product = build(:product, shipping_method: nil)
      product.valid?
      expect(product.errors[:shipping_method]).to include("を入力してください")
    end

     # 7. shipping_methodが空では登録できないこと
     it "is invalid without a shipping_charge" do
      product = build(:product, shipping_charge: nil)
      product.valid?
      # binding.pry
      expect(product.errors[:shipping_charge]).to include("を入力してください")
    end

     # 8. shipping_dayが空では登録できないこと
     it "is invalid without a shipping_day" do
      product = build(:product, shipping_day: nil)
      product.valid?
      expect(product.errors[:shipping_day]).to include("を入力してください")
    end

     # 9. product_conditionが空では登録できないこと
     it "is invalid without a product_condition" do
      product = build(:product, product_condition: nil)
      product.valid?
      expect(product.errors[:product_condition]).to include("を入力してください")
    end

     # 10. category_idが空では登録できないこと
     it "is invalid without a category_id" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    # 11. imageが空では登録できないこと
      it "is invalid without a image" do
        product_no_picture = build(:product_no_picture)
        product_no_picture.valid?
        expect(product_no_picture.errors[:product_image]).to include()
      end

     # 12. priceが300いかでは登録できないこと
     it "is invalid without a price" do
      product = build(:product, price: 100)
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end

     # 13. priceが9999999では登録できないこと
     it "is invalid without a price" do
      product = build(:product, price: 10000000)
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end

    # 14. descriptionが1000文字以上では登録できないこと
    it "is invalid without a description" do
    product = build(:product, description: "a" * 1001)
    product.valid?
    expect(product.errors[:description]).to include("は1000文字以内で入力してください")
  end

    # 15. nameが40文字以上では登録できないこと
    it "is invalid without a name" do
      product = build(:product, name: "a" * 41)
      product.valid?
      expect(product.errors[:name]).to include("は40文字以内で入力してください")
    end

    # 16. imageが空では登録できないこと
    it "is invalid without a image" do
      product_11_picture = build(:product_11_picture)
      product_11_picture.valid?
      expect(product_11_picture.errors[:product_image]).to include()
    end

  end
end