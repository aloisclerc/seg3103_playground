defmodule Grades do
  @moduledoc """
  Grades keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defmodule Calculator do
    def avg(num) do
      if Enum.count(num) == 0 do
        0
      else
        Enum.sum(num) / Enum.count(num)
      end
    end

    def calculate_grade(avg_labs, avg_homework, midterm, final) do
      0.2 * avg_labs + 0.3 * avg_homework + 0.2 * midterm + 0.3 * final
    end

    def percentage_grade(%{final: final, homework: homework, labs: labs, midterm: midterm}) do
      # homework |> Enum.map(&String.to_integer/1)

      homework_int = Enum.map(homework, fn x -> elem(Integer.parse(x), 0) end)

      avg_homework = Grades.Calculator.avg(homework_int)

      lab_int = Enum.map(labs, fn x -> elem(Integer.parse(x), 0) end)

      avg_labs = Grades.Calculator.avg(lab_int)

      mark =
        calculate_grade(
          avg_labs,
          avg_homework,
          String.to_integer(midterm),
          String.to_integer(final)
        )

      round(mark)
    end

    def letter_grade(%{final: final, homework: homework, labs: labs, midterm: midterm}) do
      # list = ["F", "E", "D", "D+", "C", "C+", "B", "B+", "A-", "A", "A+"]

      # Enum.random(list)

      mark =
        Grades.Calculator.percentage_grade(%{
          final: final,
          homework: homework,
          labs: labs,
          midterm: midterm
        })

      IO.inspect(mark)

      cond do
        mark > 89.5 -> "A+"
        mark > 84.5 -> "A"
        mark > 79.5 -> "A-"
        mark > 74.5 -> "B+"
        mark > 69.5 -> "B"
        mark > 64.5 -> "C+"
        mark > 59.5 -> "C"
        mark > 54.5 -> "D+"
        mark > 49.5 -> "D"
        mark > 39.5 -> "E"
        mark < 39.5 -> "F"
      end
    end

    def numeric_grade(%{final: final, homework: homework, labs: labs, midterm: midterm}) do
      # list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

      # Enum.random(list)

      mark =
        Grades.Calculator.percentage_grade(%{
          final: final,
          homework: homework,
          labs: labs,
          midterm: midterm
        })

      cond do
        mark > 89.5 -> "10"
        mark > 84.5 -> "9"
        mark > 79.5 -> "8"
        mark > 74.5 -> "7"
        mark > 69.5 -> "6"
        mark > 64.5 -> "5"
        mark > 59.5 -> "4"
        mark > 54.5 -> "3"
        mark > 49.5 -> "2"
        mark > 39.5 -> "1"
        mark < 39.5 -> "0"
      end
    end
  end
end
