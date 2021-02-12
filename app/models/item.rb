class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :carriage, :prefecture, :schedule

  validates :name, :text, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :carriage_id, numericality: { other_than: 1 }
  validates :schedule_id, numericality: { other_than: 1 }


end
