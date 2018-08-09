defmodule TexasHoldem do
  @moduledoc """
  Documentation for TexasHoldem.
  """
  alias TexasHoldem.Deck

  @doc """
  Hello world.

  ## Examples

      iex> TexasHoldem.hello
      :world

  """
  def main do
    Deck.shuffle()
    |> print_result("Shuffled Deck --> ")
    |> Deck.initial_deal(5)
    |> print_result("Player Hands --> ")
    |> Deck.burn_card()
    |> Deck.deal(3)
    |> print_result("Flop --> ")
    |> Deck.burn_card()
    |> Deck.deal(1)
    |> print_result("Turn --> ")
    |> Deck.burn_card()
    |> Deck.deal(1)
    |> print_result("River --> ")

    :ok
  end

  defp print_result({result, deck}, message) do
    IO.puts(message <> inspect(result))
    deck
  end

  defp print_result(deck, message) do
    IO.puts(message <> inspect(deck, limit: 52))
    deck
  end
end
