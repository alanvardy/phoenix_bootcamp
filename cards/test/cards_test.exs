defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck creates 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    new_deck = Cards.shuffle(deck)
    assert deck != new_deck
    assert length(deck) == length(new_deck)
  end
end
