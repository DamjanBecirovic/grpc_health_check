defmodule GrpcHealthCheck do
  use Application
  require Logger

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Logger.info("Running application in #{Mix.env()} environment")

    children = [
      worker(GrpcHealthCheck.Server, [50_055])
    ]

    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end
end
