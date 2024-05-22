defmodule LogLevel do
  def to_label(level, legacy?) do
    if legacy? do
      cond do
        level == 0 -> :unknown
        level == 1 -> :debug
        level == 2 -> :info
        level == 3 -> :warning
        level == 4 -> :error
        level == 5 -> :unknown
        true -> :unknown
      end
    else
      cond do
        level == 0 -> :trace
        level == 1 -> :debug
        level == 2 -> :info
        level == 3 -> :warning
        level == 4 -> :error
        level == 5 -> :fatal
        true -> :unknown
      end
    end
  end

  def alert_recipient(level, legacy?) do
    case to_label(level, legacy?) do
      :unknown ->
        cond do
          legacy? == false -> :dev2
          true -> :dev1
        end
      :error ->
        :ops
      :fatal ->
        :ops
       _ ->
        false
    end
  end
end
