defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair,1)
  end

  def to_milliliter(volume_pair) do
    {unit, amount} = volume_pair
    cond do
      unit == :cup -> {:milliliter, amount * 240}
      unit == :fluid_ounce -> {:milliliter, amount * 30}
      unit == :teaspoon -> {:milliliter, amount * 5}
      unit == :tablespoon -> {:milliliter, amount * 15}
      unit == :milliliter -> {:milliliter, amount}
    end
  end

  def from_milliliter(volume_pair, unit) do
    {_, amount} = volume_pair
    cond do
      unit == :cup -> {:cup, amount / 240}
      unit == :fluid_ounce -> {:fluid_ounce, amount / 30}
      unit == :teaspoon -> {:teaspoon, amount / 5}
      unit == :tablespoon -> {:tablespoon, amount / 15}
      unit == :milliliter -> {:milliliter, amount}
    end
  end

  def convert(volume_pair, unit) do
    volume_pair 
    |> to_milliliter() 
    |> from_milliliter(unit)
  end
end
