

defmodule Grades.CalculatorTest do
  use ExUnit.Case
  alias Grades.Calculator

  describe "percentage_grade/1" do
    test "empty" do
      assert 41 ==
               Calculator.percentage_grade(%{
                 homework: [],
                 labs: [],
                 midterm: 0.70,
                 final: 0.9
               })
    end
    test "homework_empty" do
      assert 53 ==
               Calculator.percentage_grade(%{
                 homework: [],
                 labs: [0.6],
                 midterm: 0.70,
                 final: 0.9
               })
    end
    test "labs_empty" do
      assert 59 ==
               Calculator.percentage_grade(%{
                 homework: [0.6],
                 labs: [],
                 midterm: 0.70,
                 final: 0.9
               })
    end
    test "none_empty" do
      assert 71 ==
               Calculator.percentage_grade(%{
                 homework: [0.6],
                 labs: [0.6],
                 midterm: 0.70,
                 final: 0.9
               })
    end
  end
  describe "letter_grade/1" do
    test "homework_fail" do
      assert "EIN" ==
               Calculator.letter_grade(%{
                 homework: [0.3],
                 labs: [0.6, 0.7, 0.8],
                 midterm: 0.70,
                 final: 0.9
               })
    end
    test "exam_fail" do
      assert "EIN" ==
               Calculator.letter_grade(%{
                 homework: [0.6],
                 labs: [0.6, 0.7, 0.8],
                 midterm: 0.30,
                 final: 0.30
               })
    end
    test "few_labs" do
      assert "EIN" ==
               Calculator.letter_grade(%{
                 homework: [0.6],
                 labs: [0.6],
                 midterm: 0.70,
                 final: 0.9
               })
    end
  end
  describe "letter_grade/2" do
    test "A+" do
      assert "A+" ==
               Calculator.letter_grade(%{
                 homework: [0.99],
                 labs: [0.99, 0.99, 0.99],
                 midterm: 0.99,
                 final: 0.99
               })
    end
    test "A" do
      assert "A" ==
                Calculator.letter_grade(%{
                  homework: [0.87],
                  labs: [0.87, 0.87, 0.87],
                  midterm: 0.87,
                  final: 0.87
                })
    end
    test "A-" do
      assert "A-" ==
                Calculator.letter_grade(%{
                  homework: [0.81],
                  labs: [0.81, 0.81, 0.81],
                  midterm: 0.81,
                  final: 0.81
                })
    end
    test "B+" do
      assert "B+" ==
                Calculator.letter_grade(%{
                  homework: [0.77],
                  labs: [0.77, 0.77, 0.77],
                  midterm: 0.77,
                  final: 0.77
                })
    end
    test "B" do
      assert "B" ==
                Calculator.letter_grade(%{
                  homework: [0.71],
                  labs: [0.71, 0.71, 0.71],
                  midterm: 0.71,
                  final: 0.71
                })
    end
    test "C+" do
      assert "C+" ==
                Calculator.letter_grade(%{
                  homework: [0.67],
                  labs: [0.67, 0.67, 0.67],
                  midterm: 0.67,
                  final: 0.67
                })
    end
    test "C" do
      assert "C" ==
                Calculator.letter_grade(%{
                  homework: [0.62],
                  labs: [0.62, 0.62, 0.62],
                  midterm: 0.62,
                  final: 0.62
                })
    end
    test "D+" do
      assert "D+" ==
                Calculator.letter_grade(%{
                  homework: [0.57],
                  labs: [0.57, 0.57, 0.57],
                  midterm: 0.57,
                  final: 0.57
                })
    end
    test "D" do
      assert "D" ==
                Calculator.letter_grade(%{
                  homework: [0.52],
                  labs: [0.52, 0.52, 0.52],
                  midterm: 0.52,
                  final: 0.52
                })
    end
    test "E" do
      assert "E" ==
                Calculator.letter_grade(%{
                  homework: [0.42],
                  labs: [0.42, 0.42, 0.42],
                  midterm: 0.42,
                  final: 0.42
                })
    end
    test "F" do
      assert "F" ==
                Calculator.letter_grade(%{
                  homework: [0.40],
                  labs: [0.25, 0.25, 0.25, 0.25],
                  midterm: 0.40,
                  final: 0.40
                })
    end
  end
  describe "numeric_grade/1" do
    test "homework_fail" do
      assert 0 ==
               Calculator.numeric_grade(%{
                 homework: [0.3],
                 labs: [0.6, 0.7, 0.8],
                 midterm: 0.70,
                 final: 0.9
               })
    end
    test "exam_fail" do
      assert 0 ==
               Calculator.numeric_grade(%{
                 homework: [0.6],
                 labs: [0.6, 0.7, 0.8],
                 midterm: 0.30,
                 final: 0.30
               })
    end
    test "few_labs" do
      assert 0 ==
               Calculator.numeric_grade(%{
                 homework: [0.6],
                 labs: [0.6],
                 midterm: 0.70,
                 final: 0.9
               })
    end
  end
  describe "numeric_grade/2" do
    test "10" do
      assert 10 ==
               Calculator.numeric_grade(%{
                 homework: [0.99],
                 labs: [0.99, 0.99, 0.99],
                 midterm: 0.99,
                 final: 0.99
               })
    end
    test "9" do
      assert 9 ==
                Calculator.numeric_grade(%{
                  homework: [0.87],
                  labs: [0.87, 0.87, 0.87],
                  midterm: 0.87,
                  final: 0.87
                })
    end
    test "8" do
      assert 8 ==
                Calculator.numeric_grade(%{
                  homework: [0.81],
                  labs: [0.81, 0.81, 0.81],
                  midterm: 0.81,
                  final: 0.81
                })
    end
    test "7" do
      assert 7 ==
                Calculator.numeric_grade(%{
                  homework: [0.77],
                  labs: [0.77, 0.77, 0.77],
                  midterm: 0.77,
                  final: 0.77
                })
    end
    test "6" do
      assert 6 ==
                Calculator.numeric_grade(%{
                  homework: [0.71],
                  labs: [0.71, 0.71, 0.71],
                  midterm: 0.71,
                  final: 0.71
                })
    end
    test "5" do
      assert 5 ==
                Calculator.numeric_grade(%{
                  homework: [0.67],
                  labs: [0.67, 0.67, 0.67],
                  midterm: 0.67,
                  final: 0.67
                })
    end
    test "4" do
      assert 4 ==
                Calculator.numeric_grade(%{
                  homework: [0.62],
                  labs: [0.62, 0.62, 0.62],
                  midterm: 0.62,
                  final: 0.62
                })
    end
    test "3" do
      assert 3 ==
                Calculator.numeric_grade(%{
                  homework: [0.57],
                  labs: [0.57, 0.57, 0.57],
                  midterm: 0.57,
                  final: 0.57
                })
    end
    test "2" do
      assert 2 ==
                Calculator.numeric_grade(%{
                  homework: [0.52],
                  labs: [0.52, 0.52, 0.52],
                  midterm: 0.52,
                  final: 0.52
                })
    end
    test "1" do
      assert 1 ==
                Calculator.numeric_grade(%{
                  homework: [0.42],
                  labs: [0.42, 0.42, 0.42],
                  midterm: 0.42,
                  final: 0.42
                })
    end
    test "0" do
      assert 0 ==
                Calculator.numeric_grade(%{
                  homework: [0.40],
                  labs: [0.25, 0.25, 0.25],
                  midterm: 0.40,
                  final: 0.40
                })
    end
  end
end
