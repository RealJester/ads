class AdvertismentsTag < ApplicationRecord
  belongs_to :tag
  belongs_to :advertisment
end
