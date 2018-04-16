defmodule ElixirExtras do
  @moduledoc """
  Extra's for Elixir. 
  """

  defmacro __using__(_) do
    quote do
      import ShorterMaps
      import ElixirExtras.Fold
    end
  end

end
