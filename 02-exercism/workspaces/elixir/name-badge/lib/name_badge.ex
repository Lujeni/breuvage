defmodule NameBadge do
  def print(nil, name, nil) do "#{name} - OWNER" end
  def print(id, name, nil) do "[#{id}] - #{name} - OWNER" end
  def print(nil, name, department) do "#{name} - #{String.upcase(department)}" end
  def print(id, name, department) do "[#{id}] - #{name} - #{String.upcase(department)}" end
end
