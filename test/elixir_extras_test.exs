defmodule ElixirExtrasTest do
  use ExUnit.Case
  doctest ElixirExtras
  doctest ElixirExtras.Fold

  use ElixirExtras

  test "greets the world" do

    res = fold {num, acc} <~ [1,2,3] do num + acc end

    assert 6 == res
  end

  test "rebind in place" do

    import ElixirExtras.Rebind

    a = %{id: 0}

    a <<~ [id: 23]

    assert %{id: 23} == a
  end
end
