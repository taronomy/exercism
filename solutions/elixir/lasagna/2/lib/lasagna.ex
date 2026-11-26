defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(elapse) do
    expected_minutes_in_oven() - elapse
  end

  def preparation_time_in_minutes(layer), do: layer * 2 

  def total_time_in_minutes(layer, elapse) do 
    preparation_time_in_minutes(layer) + elapse
  end

  def alarm, do: "Ding!"
end
