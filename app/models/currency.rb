class Currency < ApplicationRecord
  validates :amount, :currency_from, :currency_to, presence: true
end
