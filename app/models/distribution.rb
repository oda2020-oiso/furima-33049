class Distribution < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token

  belongs_to :order
  belongs_to_active_hash :prefecture


end
