class Dialect < ApplicationRecord
  validates :name, :apiurl, :icon, presence: true
end
