defmodule ElixirExtras.Fold do

  @doc """
  Elixir Fold Comprehension.

  ## Examples

  iex> import ElixirExtras.Fold; fold {num, acc} <~ [1,2,3] do num + acc end
  6

  """
  defmacro fold(clause, do: expression) do

    {:<~, _line, [{val, acc}, values]} = clause

    quote do
      Enum.reduce(unquote(values), fn unquote(val), unquote(acc) -> unquote(expression) end)
    end
  end

  @doc """
  Elixir Fold Comprehension.

  ## Examples

  iex> import ElixirExtras.Fold; fold {num, acc} <~ [1,2,3], init: 100 do num + acc end
  106

  """
  defmacro fold(clause, init_expr, do: expression) do
    {:<~, _line, [{val, acc}, values]} = clause
    [init: init] = init_expr

    quote do
      Enum.reduce(unquote(values), unquote(init), fn unquote(val), unquote(acc) -> unquote(expression) end)
    end
  end
end
