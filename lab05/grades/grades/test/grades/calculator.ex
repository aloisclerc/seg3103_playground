defmodule Grades.CalculatorTest do
  use ExUnit.Case
  import Grades.Calculator

  test "1" do
    assert letter_grade(100, 100, 100 ,100) == 100
  end

end
