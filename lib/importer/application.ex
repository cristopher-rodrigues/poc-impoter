defmodule Importer.Application do
  @moduledoc "OTP Application specification for Importer"

  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Importer.Endpoint,
        # Set the port per environment, see ./config/MIX_ENV.exs
        options: [port: Application.get_env(:importer, :port)]
      )
    ]

    opts = [strategy: :one_for_one, name: Importer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
