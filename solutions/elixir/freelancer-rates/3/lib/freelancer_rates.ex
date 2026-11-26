defmodule FreelancerRates do
  def daily_rate(hourly), do: hourly * 8.0

  def apply_discount(amount, percent), do: amount - amount * percent / 100

  def monthly_rate(hourly, discount) do
    daily_rate(hourly) * 22 |> apply_discount(discount) |> ceil
  end

  def days_in_budget(budget, hourly, discount) do
    day = daily_rate(hourly) |> apply_discount(discount)
    
    budget / day |> Float.floor(1)
  end
end
