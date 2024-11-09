class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :category_id, numericality: { other_than: 1, message: "Category can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "Sales status can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "Shipping fee status can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "Prefecture can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "Scheduled delivery can't be blank" }

  validates :image, presence: { message: "Image can't be blank" }
  validates :item_name, presence: { message: "Name can't be blank" }
  validates :description, presence: { message: "Info can't be blank" }

  validates :price, presence: { message: "Price can't be blank" }, 
                  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "Price is out of setting range" }

end
