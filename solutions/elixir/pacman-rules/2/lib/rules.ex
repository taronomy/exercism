defmodule Rules do
  def eat_ghost?(pellet?, ghost?), do: pellet? and ghost?

  def score?(pellet?, dot?), do: pellet? or dot?

  def lose?(pellet?, ghost?), do: not pellet? and ghost?

  def win?(clear?, pellet?, ghost?) do
    clear? and not lose?(pellet?, ghost?)
  end
end
