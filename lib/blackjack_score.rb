# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  hand.each do |card|
    if !VALID_CARDS.include?(card)
      raise ArgumentError.new("That's not a valid card!")
    end
  end

  raise ArgumentError.new("Invalid amount of cards") if hand.length < 2 || hand.length > 5

  if check_ace?(hand)
    hand = convert_ace(hand)
  else
    hand = convert_hand(hand)
  end

  score = hand.sum
  if score > 21
    raise ArgumentError.new("You lose!")
  end
  return score
end

def convert_hand(hand)
  converted_hand = []
  hand.each do |card|
    if card.instance_of? Integer
      converted_hand.push(card)
    elsif card.instance_of? String
      converted_hand.push(10)
    end
  end
  return converted_hand
end

def check_ace?(hand)
  if hand.include? "Ace"
    return true
  end
  return false
end

def convert_ace(hand)
  converted_ace = []
  if check_ace?(hand)
    sum = 0
    hand.each do |card|
      if card != "Ace"
        sum += card
        converted_ace.push(card)
      end
    end
  end

  hand.each do |card|
    if sum > 10 && card == "Ace"
      card = 1
      converted_ace.push(card)
    elsif sum <= 10 && card == "Ace"
      card = 11
      converted_ace.push(card)
    end
  end
  return converted_ace
end