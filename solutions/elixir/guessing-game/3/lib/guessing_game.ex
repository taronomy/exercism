defmodule GuessingGame do
  @spec compare(number, number) :: String.t()
  def compare(secret, guess \\ :no_guess)
  def compare(_, guess) when not is_number(guess), do: "Make a guess"
  def compare(secret, secret), do: "Correct"
  def compare(secret, guess) when abs(secret - guess) <= 1, do: "So close"
  def compare(secret, guess) when secret < guess, do: "Too high"
  def compare(secret, guess) when secret > guess, do: "Too low"
end