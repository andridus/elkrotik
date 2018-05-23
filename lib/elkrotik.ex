defmodule Elkrotik do
  use Application

  @moduledoc """
  Documentation for Elkrotik.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Elkrotik.hello
      :world

  """

  def start(_type, _args) do
    #import Supervisor.Spec
    #children = [
    #  supervisor(Elkrotik.Supervisor, [], [restart: :permanent, name: __MODULE__])
    #]
    #Supervisor.start_link(children, strategy: :one_for_one )
    Elkrotik.Supervisor.start_link
    {:ok, self()}
  end

  
end
