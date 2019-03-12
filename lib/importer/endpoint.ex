defmodule Importer.Endpoint do
  @moduledoc """
  A Plug responsible for logging request info, parsing request body's as JSON,
  matching routes, and dispatching responses.
  """

  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  plug(:dispatch)

  post "/importer" do
    Task.Supervisor.start_child(Importer.TaskSupervisor, fn ->
      File.stream!("/Users/pipefy/importer/file", read_ahead: 100_000)
      |> Stream.chunk_by(&String.ends_with?(&1, "*\n"))
      |> Task.async_stream(&proccess_line(&1))
    end)

    send_resp(conn, 200, "ok")
  end

  defp proccess_line(line) do
    IO.inspect line
  end

  match _ do
    send_resp(conn, 404, "oops... Nothing here :(")
  end
end
