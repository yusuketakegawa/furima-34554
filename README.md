#テーブル設計

## users テーブル

| Colum                 |  Type     | Option                   |
|-----------------------|-----------| -------------------------| 
| email                 |  string   | null: false   unique:true|
| encrypted_password    |  integer  | null: false              |
| nickname              |  string   | null: false              |
| birthday              |  string   | null: false              |
| name                  |  string   | null: false              |


### Association
-has many :items
-has many :buys

##  itemsテーブル

| Colum     |  Type      | Option                         |
|---------- |------------| ------------------------------ | 
| name      |  string    | null: false                    |
| category  |  string    | null: false                    |
| price     |  string    | null: false                    |
| user      |  references| null: false, foreign_key: true |

### Association
-has one :buys
-belongs_to :user
-has one :shipping

## buys テーブル

| Colum     |  Type     | Option                           |
|---------- |--------------| ------------------------------| 
| user      |  references  | null: false, foreign_key: true|
| items     |  references  | null: false, foreign_key: true|
| shipping  |  references  | null: false, foreign_key: true|

### Association
-belongs_to :user
-belongs_to :item
-has one :shipping

## shipping テーブル

| Colum       |  Type      | Option                         |
|-------------|------------| ------------------------------ | 
| address     |  string    | null: false,                   |
| prefecture  |  string    | null: false,                   |
| building    |  text      |                                |
| postal code |  string    | null: false,                   |
| phone number|  string    | null: false,                   |
| buys        |  references| null: false, foreign_key: true |
| items       |  references| null: false, foreign_key: true |

### Association
belongs_to :buys
belongs_to :item
