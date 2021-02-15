class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :carriage, :prefecture, :schedule
  has_one_attached :image
  belongs_to :user


  with_options presence: true do

    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :carriage_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :schedule_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than: 299, less_than: 10000000}
    validates :image
  end


end
