#テーブル設計

## users テーブル

| Colum                 |  Type     | Option                   |
|-----------------------|-----------| -------------------------| 
| email                 |  string   | null: false   unique:true|
| encrypted_password    |  string   | null: false              |
| nickname              |  string   | null: false              |
| birthday              |  date     | null: false              |
| last_name             |  string   | null: false              |
| first_name            |  string   | null: false              |
| last_name_kana        |  string   | null: false              |
| first_name_kana       |  string   | null: false              |

### Association
-has_many :items
-has_many :buys

##  itemsテーブル

| Colum            |  Type      | Option                         |
|------------------|------------| ------------------------------ | 
| name             |  string    | null: false                    |
| item_explanation |  text      | null: false                    |
| category_id      |  integer   | null: false                    |
| price            |  integer   | null: false                    |
| user             |  references| null: false, foreign_key: true |
| status_id        |  integer   | null: false                    |
| delivery_fee_id  |  integer   | null: false                    |
| prefecture_id    |  integer   | null: false                    |
| shipping_date_id |  integer   | null: false                    |

### Association
-has_one :buy
-belongs_to :user

## buys テーブル

| Colum     |  Type     | Option                           |
|---------- |--------------| ------------------------------| 
| user      |  references  | null: false, foreign_key: true|
| item      |  references   | null: false, foreign_key: true|

### Association
-belongs_to :user
-belongs_to :item
-has_one :shipping

## shipping テーブル

| Colum         |  Type      | Option                         |
|---------------|------------| ------------------------------ | 
| address       |  string    | null: false                    |
| municipality  |  string    | null: false                    |
| prefecture_id |  integer   | null: false                    |
| building      |  string    |                                |
| postal_code   |  string    | null: false                    |
| phone_number  |  string    | null: false                    |
| buy           |  references| null: false, foreign_key: true |

### Association
belongs_to :buy
