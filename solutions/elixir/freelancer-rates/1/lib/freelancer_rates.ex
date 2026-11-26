defmodule FreelancerRates do
  @daily_workhour 8.0
  @monthly_workday 22.0

  @spec daily_rate(number) :: float
  def daily_rate(hourly_rate), do: hourly_rate * @daily_workhour

  @spec apply_discount(number, number) :: float
  def apply_discount(before_discount, discount) do
    discount
    |> Kernel./(100)
    |> Kernel.*(before_discount)
    |> (& before_discount - &1).()
  end

  @spec monthly_rate(number, number) :: integer
  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> Kernel.*(@monthly_workday)
    |> apply_discount(discount)
    |> ceil()
  end

  @spec days_in_budget(number, number, number) :: float
  def days_in_budget(budget, hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
    |> (& budget / &1).()
    |> Float.floor(1)
  end
end
