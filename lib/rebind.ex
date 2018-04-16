defmodule ElixirExtras.Rebind do

  @doc """
  Elixir Fold Comprehension.

  ## Examples

  iex> import ElixirExtras.Rebind; a = %{id: 0}; a <<~ [id: 23]
  %{id: 23} == a

  """
  defmacro var <<~ expr do

    {name, meta, nil} = var
    [{key, val}] = expr

    IO.inspect key, label: :key_rebar
    IO.inspect expr, label: :expr_rebar

    # key! = insert_path(variable, key)
    # var!(unquote(variable)) = Kernel.put_in(unquote(key!), unquote(expr))

    quote do
      var!(unquote(var)) = %{ var!(unquote(var)) | unquote(key) => unquote(val) }
    end
  end

  def insert_path(pre, {term, meta, []} = _wrapper), do: {insert_path(pre, term), meta, []}
  def insert_path(pre, {:., meta, args} = _term), do: {:., meta, insert_path(pre, args)}

  def insert_path(pre, [term | rem] = _args),
    do: [insert_path(pre, term) | insert_path(term, rem)]

  def insert_path(pre, [] = _last_arg), do: []
  def insert_path(pre, name) when is_atom(name), do: name

  def insert_path(pre, {prev_head, meta, args}) do
    term = {:., meta, [pre, prev_head]}
    {term, meta, []}
  end

end
