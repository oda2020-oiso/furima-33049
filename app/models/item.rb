class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :carriage, :prefecture, :schedule
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
    validates :image

    with_option numericality: {other_than: 1 } do
      validates :category_id 
      validates :condition_id
      validates :carriage_id
      validates :prefecture_id
      validates :schedule_id
    end
  end
end
