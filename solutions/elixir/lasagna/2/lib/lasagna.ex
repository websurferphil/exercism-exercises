defmodule Lasagna do
  # 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven do 
    40
  end

  # 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(num) do
    expected_minutes_in_oven() - num
  end
  
  # 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(num) do
    num * 2
  end

  # 'total_time_in_minutes/2' function
  def total_time_in_minutes(layers, minutes) do
    preparation_time_in_minutes(layers) + minutes
  end

  # 'alarm/0' function
  def alarm do
    "Ding!"
  end
end
