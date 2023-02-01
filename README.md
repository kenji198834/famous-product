# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| product            | text   | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |  

### Association

  has_many :posts
  has_many :comments

## posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| message | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association
  
  has_many :comments
  belongs_to :user

## comments テーブル

| Column  | Type       | Options                        |    
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |       
| post    | references | null: false, foreign_key: true |

### Association

  belongs_to :user
  belongs_to :post