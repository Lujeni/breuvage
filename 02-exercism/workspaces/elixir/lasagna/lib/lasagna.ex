defmodule Lasagna do
  def expected_minutes_in_oven() do
    40
  end

  def remaining_minutes_in_oven(in_oven) do
    expected_minutes_in_oven() - in_oven
  end

  defp time_prepare_layer_in_minutes() do
    2
  end

  def preparation_time_in_minutes(layer) do
    layer * time_prepare_layer_in_minutes()
  end

  def total_time_in_minutes(layer, in_oven) do
    preparation_time_in_minutes(layer) + in_oven
  end

  def alarm() do
    "Ding!"
  end
end
