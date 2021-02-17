#テーブル設計

## users テーブル

| Colum                 |  Type     | Option                   |
|-----------------------|-----------| -------------------------| 
| email                 |  string   | null: false   unique:true|
| encrypted_password    |  integer  | null: false              |
| nickname              |  string   | null: false              |
| birthday              |  string   | null: false              |
| last_name             |  string   | null: false              |
| first_name            |  string   | null: false              |
| last_name(kana)       |  string   | null: false              |
| first_name(kana)      |  string   | null: false              |

### Association
-has many :items
-has many :buys

##  itemsテーブル

| Colum         |  Type      | Option                         |
|---------------|------------| ------------------------------ | 
| name          |  string    | null: false                    |
| category      |  string    | null: false                    |
| price         |  integer   | null: false                    |
| user          |  references| null: false, foreign_key: true |
| status        |  string    | null: false                    |
| delivery_fee  |  integer   | null: false, foreign_key: true |
| region        |  string    | null: false                    |
| shipping_date |  date      | null: false, foreign_key: true |

### Association
-has one :buy
-belongs_to :user

## buys テーブル

| Colum     |  Type     | Option                           |
|---------- |--------------| ------------------------------| 
| user      |  references  | null: false, foreign_key: true|
| item     |  references  | null: false, foreign_key: true|
| shipping  |  references  | null: false, foreign_key: true|

### Association
-belongs_to :user
-belongs_to :item
-has one :shipping

## shipping テーブル

| Colum         |  Type      | Option                         |
|---------------|------------| ------------------------------ | 
| address       |  string    | null: false,                   |
| prefecture_id |  integer   | null: false,                   |
| building      |  string    |                                |
| postal code   |  string    | null: false,                   |
| phone number  |  string    | null: false,                   |
| buy           |  references| null: false, foreign_key: true |

### Association
belongs_to :buys
