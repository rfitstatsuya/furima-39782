class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :derivery_cost
  belongs_to :prefecture
  belongs_to :sending_date

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality: { only_integer: true, in: 300..9_999_999 }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :derivery_cost_id
    validates :prefecture_id
    validates :sending_date_id
  end
end
