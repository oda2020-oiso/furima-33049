class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :carriage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :schedule


  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :carriage_id
      validates :prefecture_id
      validates :schedule_id
    end
  end
end
