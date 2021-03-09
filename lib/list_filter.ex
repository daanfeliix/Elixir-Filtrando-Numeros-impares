defmodule ListFilter do
  def call(list) do
    list = removeCaracters(list)
    list = removePairs(list)
    Enum.count(list)
  end

  defp removeCaracters(list) do
    Enum.flat_map(list, fn elem ->
      case Integer.parse(elem) do
        {int, _rest} -> [int]
        :error -> []
      end
    end)
  end

  defp removePairs(list) do
    Enum.filter(list, fn elem -> rem(elem, 2) !== 0 end)
  end
end
