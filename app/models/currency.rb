class Currency < ApplicationRecord
  validates :base, :date, :rates, presence: true
end
