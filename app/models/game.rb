class Game < ApplicationRecord
  has_one :dealer
  has_many :players
end
