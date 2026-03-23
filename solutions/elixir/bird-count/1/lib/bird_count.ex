defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]
  def increment_day_count([head]), do: [head + 1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?(list) , do: 0 in list

  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  def busy_days([]), do: 0
  def busy_days(list), do: Enum.count(list, fn elem -> elem > 4 end)
end
