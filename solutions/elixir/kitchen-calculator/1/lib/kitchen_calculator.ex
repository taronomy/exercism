defmodule KitchenCalculator do
  @type volume :: {atom, number}

  @ml_per %{
    milliliter: 1,
    teaspoon: 5,
    tablespoon: 15,
    fluid_ounce: 30,
    cup: 240
  }

  @spec get_volume(volume) :: number
  def get_volume({_unit, quantity}), do: quantity

  @spec to_milliliter(volume) :: volume
  def to_milliliter({unit, quantity}), do: {:milliliter, @ml_per[unit] * quantity}

  @spec from_milliliter(volume, atom) :: volume
  def from_milliliter({:milliliter, quantity}, unit), do: {unit, quantity / @ml_per[unit]}

  @spec convert(volume, atom) :: volume
  def convert(volume, unit), do: to_milliliter(volume) |> from_milliliter(unit)
end
