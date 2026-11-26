defmodule GuessingGame do
  @spec compare(integer, integer) :: String.t()
  def compare(secret, secret), do: "Correct"
  def compare(_, guess \\ :no_guess) when not is_number(guess), do: "Make a guess"
  def compare(secret, guess) when abs(secret - guess) <= 1, do: "So close"
  def compare(secret, guess) when secret < guess, do: "Too high"
  def compare(secret, guess) when secret > guess, do: "Too low"
end