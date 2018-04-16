defmodule ElixirExtrasTest do
  use ExUnit.Case
  doctest ElixirExtras
  doctest ElixirExtras.Fold

  use ElixirExtras

  test "greets the world" do

    res = fold {num, acc} <~ [1,2,3] do num + acc end

    assert 6 == res
  end
end
