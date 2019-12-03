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
|last_name|string|null: false|
|first_name|string|null: false|
|phone_number|string|
|profile_name|string|null: false|
|profile_text|text|null: false|
|card_number|integer|null: false|
|expiration_date_month|integer|null: false|
|expiration_date_days|integer|null: false|
|security_code|integer|null: false|
|nickname|string|null: false|
|mail_address|string|null: false, unique: true|
|nickname|string|null: false|
|password|string|null: false|
|birthday|date|null: false|

### Association
- has_many :users_exhibits
- has_many :users_purchases
- has_many :products, through: :users_exhibits
- has_many :products, through: :users_purchases
- has_one :address




## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|user_id|integer|null: false, foreign_key: true|


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
- has_many :users_exhibits
- has_many :users_purchases
- has_many :product_images
- has_many :users, through: :users_exhibits
- has_many :users, through: :users_purchases
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

