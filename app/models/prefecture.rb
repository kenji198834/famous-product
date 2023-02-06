class Prefecture < ApplicationRecord

  has_many :post_prefectures
  has_many :posts, through: :post_prefectures

end