class CardCoder
  def self.dump(cards)
    cards.map { |card| { rank: card.rank, suit: card.suit } }.to_json
  end

  def self.load(json)
    card_hashes = JSON.parse(json)
    card_hashes.map { |card_hash| Card.new(card_hash['suit'], card_hash['rank']) }
  end
end
