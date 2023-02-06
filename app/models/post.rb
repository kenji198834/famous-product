class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :prefecture
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :message, presence: true
  validates :image, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end