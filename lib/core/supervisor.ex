defmodule Elkrotik.Supervisor do
  use Supervisor
  @registered_name ElkrotikSupervisor

  def start_link do
    IO.puts("dasdsad aqui")
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(Elkrotik.Core,[], [restart: :transient])
    ]

    supervise(children, [{:strategy, :one_for_one}, {:max_restarts, 10}])
  end
end
