# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| product            | text   | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |  

### Association

  has_many :rooms
  has_many :rooms, through: :room_users
  has_many :posts
  has_many :comments

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- | 
| name   | string | null: false |

### Association

  has_many :room_users
  has_many :users, through: room_users
  has_many :posts
  has_many :comments

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

  belongs_to :room
  belongs_to :user

## posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| message | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association
  
  has_many :comments
  belongs_to :user
  belongs_to :room
  
## comments テーブル

| Column  | Type       | Options                        |    
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |       
| post    | references | null: false, foreign_key: true |

### Association

  belongs_to :user
  belongs_to :post
  belongs_to :room