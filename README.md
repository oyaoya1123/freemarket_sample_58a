# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|last_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|phone_number|integer|null: false|

|profile_name|string|null: false|
|profile_text|text|null: false|
|expiration_date_month|integer|null: false|
|expiration_date_days|integer|null: false|
|security_code|integer|null: false|

### Association
- has_many :users_exhibits, dependent: :destroy
- has_many :users_purchases, dependent: :destroy
- has_many :ex_products, through: :users_exhibits, source: :product, dependent: :destroy
- has_many :pu_products, through: :users_purchases, source: :product, dependent: :destroy
- has_one :address, dependent: :destroy
- has_one :cards, dependent: :destroy
- has_many :sns_credentials, dependent: :destroy


## Sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|uid|string|null: false|
|provider|string|null: false|
|user_id|bigint|foreign_key: true|

### Association
- belongs_to :user, optional: true


## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|address_last_name|string|null: false|
|address_first_name|string|null: false|
|address_last_name_kana|string|null: false|
|address_first_name_kana|string|null: false|
|address_phone_number|string|
|user_id|biginteger|null: false, foreign_key: true|

### Association
- belongs_to :user


## users_exhibitsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
|produt_status_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
- belongs_to :produt_status


## users_purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
|produt_status_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
- belongs_to :produt_status


## produt_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :users_exhibits
- has_many :users_purchases


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|string|null: false|
|price|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|subcategory_id|integer|null: false, foreign_key: true|
|subsubcategory_id|integer|null: false, foreign_key: true|
|product_condition_id|integer|null: false, foreign_key: true|
|shipping_charge_id|integer|null: false, foreign_key: true|
|shipping_origin_id|integer|null: false, foreign_key: true|
|shipping_day_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- has_one :users_exhibit, dependent: :destroy
- has_one :users_purchase, dependent: :destroy
- has_many :product_images, dependent: :destroy
- has_one :ex_user, through: :users_exhibit, source: :user
- has_one :pu_user, through: :users_purchase, source: :user
- belongs_to :catergory
- belongs_to :product_condition
- belongs_to :shipping_charge
- belongs_to :shipping_origin
- belongs_to :shipping_day
- belongs_to : brand


## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product


## product_conditionsテーブル 商品の状態
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :products


## shipping_chargesテーブル 発送料の負担
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :products


## shipping_originsテーブル 発送元の地域
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :products


## shipping_daysテーブル 発送までの日数
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :products


## catergorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :products
- has_many :brands_catergorys
- has_many :brands, through: :brands_catergorys
- has_ancestry


## brandsテーブル ブランド
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :products
- has_many :brands_catergorys
- has_many :catergorys, through: :brands_catergorys


## brands_catergorysテーブル 
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null: false, unique: true|
|catergory_id|integer|null: false, unique: true|

### Association
- belongs_to :brand
- belongs_to :catergory
