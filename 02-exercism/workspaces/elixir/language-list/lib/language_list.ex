defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    if list == [] do
      [language]
    else
      [language | list]
    end
  end

  def remove(list) do
    [_head | tail] = list
    List.delete(list, _head)
  end

  def first(list) do
    [_head | tail] = list
    _head
  end

  def count(list) do
    Enum.count(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
