defmodule LogLevel do
  @label %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }
  
  def to_label(level, legacy?) do
    cond do
      level in 0..5 and not legacy? -> @label[level]
      level in 1..4 and legacy? -> @label[level]
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
  
    cond do
      label in [:error, :fatal] -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown -> :dev2
      true -> false
    end
  end
end
