defmodule KitchenCalculator do
  def get_volume(volume_pair) do elem(volume_pair, 1) end

  def to_milliliter({:cup, unit}) do {:milliliter, 240 * unit} end
  def to_milliliter({:fluid_ounce, unit}) do {:milliliter, 30 * unit} end
  def to_milliliter({:teaspoon, unit}) do {:milliliter, 5 * unit} end
  def to_milliliter({:tablespoon, unit}) do {:milliliter, 15 * unit} end
  def to_milliliter({:milliliter, unit}) do {:milliliter, unit} end

  def from_milliliter({:milliliter, unit}, :cup) do {:cup, unit / 240} end
  def from_milliliter({:milliliter, unit}, :fluid_ounce) do {:fluid_ounce, unit / 30} end
  def from_milliliter({:milliliter, unit}, :teaspoon) do {:teaspoon, unit / 5} end
  def from_milliliter({:milliliter, unit}, :tablespoon) do {:tablespoon, unit / 15} end
  def from_milliliter({:milliliter, unit}, :milliliter) do {:milliliter, unit} end

  def convert({from_type, unit}, to_type) do from_milliliter(to_milliliter({from_type, unit}), to_type) end
end
