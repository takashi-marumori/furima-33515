# テーブル設計

## users　テーブル

|column    |Type   |Options                  |
|----------|-------|-------------------------|
|nickname  |string |null: false              |
|email     |string |null: false              |
|password  |string |null: false, unique: true|
|first_name|string |null: false              |
|last_name |string |null: false              |
|birthday  |integer|null: false              |

### Association

- has_many :items
- has_mane :orders

## items テーブル

|column     |Type         |Options          |
|-----------|-------------|-----------------|
|title      |string       |null: false      |
|price      |integer      |null: false      |
|category   |text         |null: false      |
|item_status|text         |null: false      |
|burden     |text         |null: false      |
|area       |text         |null: false      |
|days       |text         |null: false      |
|image      |ActiveStorage|null: false      |
|user_id    |references   |foreign_key: true|

### Association
- belongs_to: user
- has_one   : order

## orders テーブル

|column      |Type      |Options          |
|------------|----------|-----------------|
|user_id     |references|foreign_key: true|
|item_id     |references|foreign_key: true|

### Association
- belongs_to: user
- belongs_to: item
- has_one   : residence

## residences テーブル

|column       |Type      |Options          |
|-------------|----------|-----------------|
|postal_code  |integer   |null: false      |
|prefectures  |string    |null: false      |
|municipality |string    |null: false      |
|address      |string    |null: false      |
|building_name|string    |                 |
|phone_number |integer   |null: false      |
|order_id     |references|foreign_key: true|

### Association
- belongs_to: order