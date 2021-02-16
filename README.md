#テーブル設計

## users テーブル

| Colum     |  Type     | Option     |
|---------- |-----------| ---------- | 
| email     |  string   | null: false|
| password  |  string   | null: false|
| nickname  |  string   | null: false|

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

-has one :buys
-belongs_to :user

## buys テーブル

| Colum     |  Type     | Option                           |
|---------- |--------------| ------------------------------| 
| text      |  text        | null: false                   |
| user      |  references  | null: false, foreign_key: true|
| items     |  references  | null: false, foreign_key: true|

belongs_to :user
belongs_to :item
