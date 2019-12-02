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
|postal_code|integer|null: false|
|address_Prefectures|string|null: false|
|address_city|string|null: false|
|address_house_number|string|null: false|
|address_building_name|string||
|phone_number|integer||
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



## users_exhibitsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
|produt_status_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

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
- belongs_to :produt_status


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_image|string|null: false|
|product_image2|string|
|product_image3|string|
|product_image4|string|
|product_image5|string|
|product_image6|string|
|product_image7|string|
|product_image8|string|
|product_image9|string|
|product_image10|string|
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
- has_many :users, through: :users_exhibits
- has_many :users, through: :users_purchases
- belongs_to :catergory
- belongs_to :subcatergory
- belongs_to :subsubcatergory
- belongs_to :product_condition
- belongs_to :shipping_charge
- belongs_to :shipping_origin
- belongs_to :shipping_day
- belongs_to : brand


## catergorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :products
- has_many :subcatergorys

## subcatergorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|catergory_id|ineteder|null: false, forrign_key: true|

### Association
- has_many :products
- has_many :subsubcatergorys
- belongs_to :catergory


## subsubcatergorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|subcatergory_id|ineteder|null: false, forrign_key: true|

### Association
- has_many :products
- belongs_to :subcatergory
- has_many :brands_subsubcatergorys
- has_many :brands, through: :brands_subsubcatergorys


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


## brandsテーブル ブランド
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :products
- has_many :brands_subsubcatergorys
- has_many :subsubcatergorys, through: :brands_subsubcatergorys


## brands_subsubcatergorysテーブル 
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null: false, unique: true|
|subsubcatergory_id|integer|null: false, unique: true|

### Association
- belongs_to :brand
- belongs_to :subsubcatergory

