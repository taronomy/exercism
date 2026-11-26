defmodule GuessingGame do
  @spec compare(integer, integer) :: String.t()
  def compare(secret, guess \\ nil)
  def compare(secret, guess) when not is_integer(guess), do: "Make a guess"
  def compare(secret, guess) when secret == guess, do: "Correct"
  def compare(secret, guess) when secret - guess < -1, do: "Too high"
  def compare(secret, guess) when secret - guess > 1, do: "Too low"
  def compare(secret, guess), do: "So close"
end