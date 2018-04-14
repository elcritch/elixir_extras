
# iex(29)> fold {val, acc} <~ [1,2,3], init: 100 do num + acc end
# clause: {:<~, [line: 29],
#  [{{:val, [line: 29], nil}, {:acc, [line: 29], nil}}, [1, 2, 3]]}
# clause3: [init: 100]
# expression: {:+, [line: 29], [{:num, [line: 29], nil}, {:acc, [line: 29], nil}]}
# ** (CompileError) iex:29: undefined function num/0
#     (stdlib) lists.erl:1354: :lists.mapfoldl/3
#     expanding macro: Extras.Fold.fold/3
#     iex:29: (file)
# iex(29)> fold {val, acc} <~ [1,2,3], init: 100 do num + acc end
# clause: {:<~, [line: 29],
#  [{{:val, [line: 29], nil}, {:acc, [line: 29], nil}}, [1, 2, 3]]}
# clause3: [init: 100]
# expression: {:+, [line: 29], [{:num, [line: 29], nil}, {:acc, [line: 29], nil}]}
# ** (CompileError) iex:29: undefined function num/0
#     (stdlib) lists.erl:1354: :lists.mapfoldl/3
#     expanding macro: Extras.Fold.fold/3
#     iex:29: (file)

defmodule ElixirExtras.Fold do

  @doc """
  Elixir Fold Comprehension.

  ## Examples

  iex> import ElixirExtras.Fold; fold {val, acc} <~ [1,2,3] do num + acc end
  6

  """
  defmacro fold(clause, clause3, do: expression) do
    IO.inspect clause, label: :clause
    IO.inspect clause3, label: :clause3
    IO.inspect expression, label: :expression

    quote do
      # Enum.reduce(
        # unquote(expression)
      # )
    end
  end

  @doc """
  Elixir Fold Comprehension.

  ## Examples

  iex> import ElixirExtras.Fold; fold {val, acc} <~ [1,2,3], init: 100 do num + acc end
  106

  """
  defmacro fold(clause, do: expression) do
    IO.inspect clause, label: :clause
    IO.inspect expression, label: :expression

    quote do
      # Enum.reduce(
        # unquote(expression)
      # )
    end
  end
end

