defmodule Buycar do
  def nb_months(old_car_price, new_car_price, savings_per_month, percent_loss, months \\ 0, money \\ 0)
  def nb_months(old_car_price, new_car_price, _savings_per_month, _percent_loss, months, money)
      when new_car_price <= old_car_price + money do
    {months, round(money - new_car_price + old_car_price)}
  end
  def nb_months(old_car_price, new_car_price, savings_per_month, percent_loss, months, money) do
    new_percent_loss = if Integer.mod(months, 2) == 1, do: percent_loss + 0.5, else: percent_loss

    nb_months(
      old_car_price * (100 - new_percent_loss) / 100,
      new_car_price * (100 - new_percent_loss) / 100,
      savings_per_month,
      new_percent_loss,
      months + 1,
      money + savings_per_month
    )
  end
end

ExUnit.start

defmodule BuycarTest do
  use ExUnit.Case

  defp testing(_, old_car_start_price, new_car_start_price, savings_per_month, percent_loss_by_month, answer) do
    assert Buycar.nb_months(
             old_car_start_price,
             new_car_start_price,
             savings_per_month,
             percent_loss_by_month
           ) == answer
  end

  test "nb_months" do
    testing(1, 2000, 8000, 1000, 1.5, {6, 766})
    testing(2, 12000, 8000, 1000, 1.5, {0, 4000})
    testing(3, 8000, 12000, 500, 1, {8, 597})
    testing(4, 18000, 32000, 1500, 1.25, {8, 332})
  end
end
