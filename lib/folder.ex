defmodule ElixirExtras.Fold do
  @doc """
  Elixir Fold Comprehension.

  ## Examples

  iex> import ElixirExtras.Fold; fold {num, acc} <~ [1,2,3] do num + acc end
  6

  """
  defmacro fold({:<~, _line, [{val, acc}, values]}, do: expression) do
    quote do
      Enum.reduce(unquote(values), fn unquote(val), unquote(acc) ->
        unquote(expression)
      end)
    end
  end

  @doc """
  Elixir Fold Comprehension.

  ## Examples

  iex> import ElixirExtras.Fold; fold {num, acc} <~ [1,2,3], init: 100 do num + acc end
  106

  """
  defmacro fold({:<~, _line, [{val, acc}, values]}, [init: init], do: expression) do
    quote do
      Enum.reduce(unquote(values), unquote(init), fn unquote(val), unquote(acc) ->
        unquote(expression)
      end)
    end
  end

  @doc """
  Elixir Folder Comprehension.

  ## Examples

  iex> import ElixirExtras.Fold; foldB {num, acc} <- [1,2,3], init: 100 do num + acc end
  106

  """
  defmacro foldB({:<-, _line, [{val, acc}, values]}, do: expression) do
    quote do
      Enum.reduce(unquote(values), fn unquote(val), unquote(acc) ->
        unquote(expression)
      end)
    end
  end

  @doc """
  Elixir Folder Comprehension.

  ## Examples

  iex> import ElixirExtras.Fold; foldB {num, acc} <- [1,2,3], init: 100 do num + acc end
  106

  """
  defmacro foldB({:<-, _line, [{val, acc}, values]}, [init: init], do: expression) do
    quote do
      Enum.reduce(unquote(values), unquote(init), fn unquote(val), unquote(acc) ->
        unquote(expression)
      end)
    end
  end
end
