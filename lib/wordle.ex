defmodule Wordle do
  def guess(guess, word) do
    guess_list = String.graphemes(guess) |> Enum.with_index()
    word_list = String.graphemes(word)

    Enum.map(guess_list, fn {ltr, i} ->
      cond do
        ltr === Enum.at(word_list, i) -> :green
        ltr in word_list -> :yellow
        true -> :grey
      end
    end)
  end
end
