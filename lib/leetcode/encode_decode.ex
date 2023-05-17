defmodule Leetcode.EncodeDecode do
  @moduledoc """
  Design an algorithm to encode a list of strings to a string. The encoded string is then sent over the network and is decoded back to the original list of strings.

  Please implement encode and decode

  Example1

  Input: ["lint","code","love","you"]
  Output: ["lint","code","love","you"]
  Explanation:
  One possible encode method is: "lint:;code:;love:;you"

  Example2

  Input: ["we", "say", ":", "yes"]
  Output: ["we", "say", ":", "yes"]
  Explanation:
  One possible encode method is: "we:;say:;:::;yes"
  """

  # in real practice would like implement jason dependency,
  # but this is just having some fun with base64 encoding

  def encode(list) do
    Enum.reduce(list, "", fn x, acc -> acc <> Base.encode64(x) <> ";" end)
  end

  def decode(str) do
    str
    |> String.trim(";")
    |> String.split(";")
    |> Enum.map(&Base.decode64!(&1))
  end
end
