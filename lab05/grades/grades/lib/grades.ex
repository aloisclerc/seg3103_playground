defmodule Grades do
  @moduledoc """
  Grades keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defmodule Calculator do

    def percentage_grade(%{final: final, homework: homework, labs: labs, midterm: midterm}) do
      list = ["10", "20", "30", "40", "50", "60", "70", "80", "87", "93", "100"]
      Enum.random(list)
    end

    def letter_grade(%{final: final, homework: homework, labs: labs, midterm: midterm}) do
      list = ["F", "E", "D", "D+", "C", "C+", "B", "B+", "A-", "A", "A+"]
      Enum.random(list)

    end

    def numeric_grade(%{final: final, homework: homework, labs: labs, midterm: midterm}) do
      list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      Enum.random(list)

    end
  end
end
