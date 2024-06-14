defmodule LibraryFees do
  def datetime_from_string(string) do
    string
    |> String.replace("Z", "")
    |> NaiveDateTime.from_iso8601!()
  end

  def before_noon?(%NaiveDateTime{hour: hour}) do
    hour < 12
  end

 def return_date(datetime) do
    days_to_add = if before_noon?(datetime), do: 28, else: 29
    datetime
    |> NaiveDateTime.add(days_to_add * 24 * 60 * 60, :second)
    |> NaiveDateTime.to_date()
  end

 def days_late(planned_return_date, %NaiveDateTime{} = actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)

    if Date.compare(actual_return_date, planned_return_date) in [:lt, :eq] do
      0
    else
      Date.diff(actual_return_date, planned_return_date)
    end
  end

  def monday?(%NaiveDateTime{} = datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout_datetime_string, actual_return_datetime_string, daily_fee) do
    checkout_datetime = datetime_from_string(checkout_datetime_string)
    actual_return_datetime = datetime_from_string(actual_return_datetime_string)
    planned_return_date = return_date(checkout_datetime)
    late_days = days_late(planned_return_date, actual_return_datetime)

    if monday?(actual_return_datetime) do
      div(late_days * daily_fee, 2)
    else
      late_days * daily_fee
    end
  end
end
