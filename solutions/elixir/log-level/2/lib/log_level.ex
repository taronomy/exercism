defmodule LogLevel do
  @log_levels 0..5
  @legacy_levels 1..4
  @labels %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }

  def to_label(level, legacy?) do
    cond do
      legacy? and level in @legacy_levels -> @labels[level]
      not legacy? and level in @log_levels -> @labels[level]
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
      label in [:error, :fatal] -> :ops
      label == :unknown -> if legacy?, do: :dev1, else: :dev2
      true -> false
    end
  end
end
