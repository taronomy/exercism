defmodule Lasagna do
  @type minutes :: integer

  @doc """
  Lasagna takes 40 minutes to cook.
  """
  @spec expected_minutes_in_oven :: minutes
  def expected_minutes_in_oven, do: 40

  @doc """
  `elapsed_minutes` has passed in the oven.
  Returns remaining minutes in the oven.
  """
  @spec remaining_minutes_in_oven(minutes) :: minutes
  def remaining_minutes_in_oven(elapsed_minutes) do
    expected_minutes_in_oven() - elapsed_minutes
  end
  
  @doc """
  Each layer in the lasagna takes 2 minutes to prepare.
  Returns the preparation minutes for adding layers.
  Cooking minutes is not included.
  """
  @spec preparation_time_in_minutes(integer) :: minutes
  def preparation_time_in_minutes(layers), do: 2 * layers

  @doc """
  Returns total minutes spent preparing and cooking the lasagna.
  Remaining minutes is not included.
  """
  @spec total_time_in_minutes(integer, minutes) :: minutes
  def total_time_in_minutes(layers, elapsed_minutes) do
    preparation_time_in_minutes(layers) + elapsed_minutes
  end

  @doc """
  Dings when the lasagna is finished in the oven.
  """
  @spec alarm() :: String.t
  def alarm(), do: "Ding!"
end
