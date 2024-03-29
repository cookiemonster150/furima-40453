class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :day

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :item_name,presence: true
  validates :description,presence: true
  validates :category_id,presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id,presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id,presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image, presence: true

end




