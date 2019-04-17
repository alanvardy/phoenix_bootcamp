defmodule Cards do
  @deck_suits ["Spades", "Clubs", "Hearts", "Diamonds"]
  @deck_values ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
  @moduledoc """
  Provides methods for creating and handing a deck of cards
  """

  @doc """
  Returns a list of strings representing a deck of playing cards

  ## Examples

  iex> deck = Cards.create_deck
  iex> {hand, _deck} = Cards.deal(deck, 1)
  iex> hand
  ["Ace of Spades"]

  """
  def create_deck do
    for suit <- @deck_suits, value <- @deck_values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Determines whether a deck contains a given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Separate a `hand_size` number of cards

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 5)
      iex> hand
      ["Ace of Spades", "2 of Spades", "3 of Spades", "4 of Spades", "5 of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "File does not exist"
    end
  end

  @doc """
  Creates a deck, shuffles it, and then returns a hand and the remainder of the deck

  ## Example

      iex> {hand, deck} = Cards.create_hand(4)
      iex> length(hand)
      4
      iex> length(deck)
      48
  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
