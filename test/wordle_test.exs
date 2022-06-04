defmodule WordleTest do
  use ExUnit.Case
  doctest Wordle

  describe "guess/2" do
    test "all incorrect" do
      assert Wordle.guess("aaaaa", "bbbbb") == [:grey, :grey, :grey, :grey, :grey]
    end

    test "one in wrong position" do
      assert Wordle.guess("baaaa", "ccbcc") == [:yellow, :grey, :grey, :grey, :grey]
    end

    test "all in wrong position" do
      assert Wordle.guess("abcde", "bcdea") == [:yellow, :yellow, :yellow, :yellow, :yellow]
    end

    test "one in correct position" do
      assert Wordle.guess("baaaa", "bbbbb") == [:green, :grey, :grey, :grey, :grey]
    end

    test "all in the correct position" do
      assert Wordle.guess("bbbbb", "bbbbb") == [:green, :green, :green, :green, :green]
    end

    test "one in correct position, one in wrong position" do
      assert Wordle.guess("bxzzz", "baxxx") == [:green, :yellow, :grey, :grey, :grey]
    end

    test "two letters in wrong position, answer only contains one" do
      assert Wordle.guess("aaxyz", "bcdwa") == [:yellow, :grey, :grey, :grey, :grey]
    end


  end

  # test "convert" do
  #   assert Wordle.convert([:incorrect, :incorrect, :incorrect, :incorrect, :incorrect]) ==
  #            "_ _ _ _ _"
  # end
end
