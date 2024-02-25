class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :day_required
  belongs_to :delivery_charge
  belongs_to :prefecture

  validates :name, :comment, :image, presence: true
  validates :price, presence: true, numericality: { 
              greater_than_or_equal_to: 300, 
              less_than_or_equal_to: 9999999,
              only_integer: { message: "is not a number" }
              }
  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :day_required_id, 
              numericality: { other_than: 1 , message: "can't be blank"}

end
