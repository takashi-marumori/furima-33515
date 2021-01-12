# テーブル設計

## users テーブル

|column            |Type   |Options                  |
|------------------|-------|-------------------------|
|nickname          |string |null: false              |
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false              |
|first_name        |string |null: false              |
|last_name         |string |null: false              |
|read_first_name   |string |null: false              |
|read_last_name    |string |null: false              |
|date              |date   |null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

|column        |Type         |Options                     |
|--------------|-------------|----------------------------|
|title         |string       |null: false                 |
|explanation   |text         |null: false                 |
|price         |integer      |null: false                 |
|category_id   |integer      |null: false, ActiveHashで実装|
|item_status_id|integer      |null: false, ActiveHashで実装|
|burden_id     |integer      |null: false, ActiveHashで実装|
|prefecture_id |integer      |null: false, ActiveHashで実装|
|day_id        |integer      |null: false, ActiveHashで実装|
|user          |references   |foreign_key: true           |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

|column      |Type      |Options          |
|------------|----------|-----------------|
|user        |references|foreign_key: true|
|item        |references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :residence

## residences テーブル

|column       |Type      |Options                     |
|-------------|----------|----------------------------|
|postal_code  |string    |null: false                 |
|prefecture_id|integer   |null: false, ActiveHashで実装|
|municipality |string    |null: false                 |
|address      |string    |null: false                 |
|building_name|string    |                            |
|phone_number |string    |null: false                 |
|order        |references|foreign_key: true           |

### Association
- belongs_to :order
