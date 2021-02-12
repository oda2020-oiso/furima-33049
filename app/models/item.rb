class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, :text, presence: true

  validates :category_id, numericality: { other_than: 1 }
end
