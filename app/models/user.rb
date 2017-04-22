class User < ApplicationRecord
  belongs_to :dialect
  scope :active_users, -> { where(active: true) }
end
