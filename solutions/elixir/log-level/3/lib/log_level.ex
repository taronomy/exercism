defmodule LogLevel do
  @labels %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }

  def to_label(level, legacy?)
  def to_label(level, false) when level in 0..5, do: @labels[level]
  def to_label(level, true) when level in 1..4, do: @labels[level]
  def to_label(_, _), do: :unknown

  def alert_recipient(level, legacy?) do
    case to_label(level, legacy?) do
      serious when serious in [:error, :fatal] -> :ops
      :unknown -> legacy? && :dev1 || :dev2
      _ignored -> false
    end
  end
end
