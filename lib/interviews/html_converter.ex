defmodule Eleetxir.Interviews.HtmlConverter do
  def convert(value) do
    # find paragraph wrapping points
    # find breaks and other types to wrap inside paragraph
    text_list = String.split(value, "\n")

    converted_list =
      Enum.map(text_list, fn line ->
        case is_paragraph?(line) do
          false -> "\n"
          _ -> paragraph(line)
        end
      end)

    # |> List.to_string()

    IO.inspect(converted_list)

    #
  end

  def is_paragraph?(line) do
    line != ""
  end

  def paragraph(line) do
    "<p> #{line} <p>"
  end
end
