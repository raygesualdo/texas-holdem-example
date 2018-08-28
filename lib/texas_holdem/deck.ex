defmodule TexasHoldem.Deck do
  @moduledoc """
  Module to manage a card deck's lifecycle
  """

  @card_suits ["❤️", "♠️", "♣️", "♦️"]
  @card_ranks ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

  @type card :: String.t()
  @type deck :: [card]
  @type hands :: [[card]]

  @doc """
  Create and shuffle a deck
  """
  @spec shuffle() :: deck
  def shuffle do
    create_cards_list() |> Enum.shuffle()
  end

  defp create_cards_list do
    Enum.flat_map(@card_suits, fn suit -> Enum.map(@card_ranks, fn rank -> rank <> suit end) end)
  end

  @doc """
  Initially deal hands to each player
  """
  @spec initial_deal(deck, Integer.t()) :: {hands, deck}
  def initial_deal(deck, player_count) do
    {cards, deck} = deal(deck, player_count * 2, [])

    hands =
      cards
      |> Enum.split(player_count)
      |> Tuple.to_list()
      |> List.zip()
      |> Enum.map(&Tuple.to_list/1)

    {hands, deck}
  end

  @doc """
  Deal N number of cards
  """
  @spec deal(deck, non_neg_integer()) :: {[card], deck}
  def deal(deck, times) do
    deal(deck, times, [])
  end

  defp deal(deck, timesRemaining, cards) when timesRemaining === 0, do: {cards, deck}

  defp deal(deck, timesRemaining, cards) do
    {card, deck} = List.pop_at(deck, 0)
    deal(deck, timesRemaining - 1, cards ++ List.wrap(card))
  end

  @doc """
  Remove a card from the top of the deck
  """
  @spec burn_card(deck) :: deck
  def burn_card(deck), do: tl(deck)
end
