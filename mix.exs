defmodule Importer.MixProject do
  use Mix.Project

  def project do
    [
      app: :importer,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Importer.Application, []}
    ]
  end

  defp deps do
    [
      {:gen_stage, "~> 0.11"},
    ]
  end
end
