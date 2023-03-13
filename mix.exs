defmodule Scurry.MixProject do
  use Mix.Project

  def project do
    [
      name: "Scurry",
      description: description(),
      app: :scurry,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      source_url: "https://github.com/eskil/scurry",
      docs: [
        main: "Quickstart",
        extras: ["Quickstart.md"]
      ]
    ]
  end

  defp description() do
    "An A-star 2D polygon map search implementation and library for Elixir"
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
    ]
  end
end
