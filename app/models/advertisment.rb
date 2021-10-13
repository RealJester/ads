class Advertisment < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true
end
