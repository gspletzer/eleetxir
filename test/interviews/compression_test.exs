defmodule Eleetxir.Interviews.CompressionTest do
  use ExUnit.Case

  import Eleetxir.Interviews.Compression

  describe "convert_string/1" do
    test "should return a string that, when read aloud,
  describes how to write the integer from left to right" do
      assert "1 1 1 2 1 3" == convert_string("123")
      assert "1 0" == convert_string("0")
      assert "2 3 1 2 2 3 3 1" == convert_string("33233111")
      assert "1 1 1 2 5 3 6 d 1 6 4 m 4 9" == convert_string("1233333dddddd6mmmm9999")
      assert "1 💯 1 🌶️ 1 👩‍❤️‍👨" == convert_string("💯🌶️👩‍❤️‍👨")
    end
  end
end
