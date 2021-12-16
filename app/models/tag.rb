class Tag < ApplicationRecord
  has_many :advertisments_tags
  has_many :advertisments, through: :advertisments_tags
end
