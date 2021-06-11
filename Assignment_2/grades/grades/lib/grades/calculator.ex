defmodule Grades.Calculator do

  def avg(num) do

      if Enum.count(num) == 0 do
        0
      else
        Enum.sum(num) / Enum.count(num)
      end
  end

  def failed_to_participate?(avg_homework, avg_exams, num_labs) do
    avg_homework < 0.4 || avg_exams < 0.4 || num_labs < 3
  end

  def calculate_grade(avg_labs, avg_homework, midterm, final) do
    0.2 * avg_labs + 0.3 * avg_homework + 0.2 * midterm + 0.3 * final
  end

  def num_labs(labs) do
    labs
    |> Enum.reject(fn mark -> mark < 0.25 end)
    |> Enum.count()
  end

  def grade_tier(mark, type) do
    cond do
      (mark > 0.895) && (type=="letter") -> "A+"
      mark > 0.845 && type=="letter" -> "A"
      mark > 0.795 && type=="letter" -> "A-"
      mark > 0.745 && type=="letter" -> "B+"
      mark > 0.695 && type=="letter" -> "B"
      mark > 0.645 && type=="letter" -> "C+"
      mark > 0.595 && type=="letter" -> "C"
      mark > 0.545 && type=="letter" -> "D+"
      mark > 0.495 && type=="letter" -> "D"
      mark > 0.395 && type=="letter" -> "E"
      mark < 0.395 && type=="letter" -> "F"
      (mark > 0.895) && (type=="number") -> 10
      mark > 0.845 && type=="number" -> 9
      mark > 0.795 && type=="number" -> 8
      mark > 0.745 && type=="number" -> 7
      mark > 0.695 && type=="number" -> 6
      mark > 0.645 && type=="number" -> 5
      mark > 0.595 && type=="number" -> 4
      mark > 0.545 && type=="number" -> 3
      mark > 0.495 && type=="number" -> 2
      mark > 0.395 && type=="number" -> 1
      mark < 0.395 && type=="number" -> 0

    end
  end

  def percentage_grade(%{homework: homework, labs: labs, midterm: midterm, final: final}) do
    avg_homework = Grades.Calculator.avg(homework)


    avg_labs = Grades.Calculator.avg(labs)

    mark = calculate_grade(avg_labs, avg_homework, midterm, final)
    round(mark * 100)
  end


  def letter_grade(%{homework: homework, labs: labs, midterm: midterm, final: final}) do
    avg_homework = Grades.Calculator.avg(homework)

    avg_labs = Grades.Calculator.avg(labs)

    avg_exams = (midterm + final) / 2

    num_labs = num_labs(labs)



    if failed_to_participate?(avg_homework, avg_exams, num_labs) do
      "EIN"
    else
      mark = calculate_grade(avg_labs, avg_homework, midterm, final)

      grade_tier(mark, "letter")
    end
  end

  def numeric_grade(%{homework: homework, labs: labs, midterm: midterm, final: final}) do
    avg_homework = Grades.Calculator.avg(homework)

    avg_labs = Grades.Calculator.avg(labs)

    avg_exams = (midterm + final) / 2

    num_labs = num_labs(labs)

    if failed_to_participate?(avg_homework, avg_exams, num_labs) do
      0
    else
      mark = calculate_grade(avg_labs, avg_homework, midterm, final)

      grade_tier(mark, "number")
    end
  end
end
