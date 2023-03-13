defmodule Scurry.MixProject do
  use Mix.Project

  def project do
    [
      name: "Scurry",
      description: description(),
      package: package(),
      app: :scurry,
      version: "1.0.0",
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

  def application do
    [
      extra_applications: [:logger, :wx]
    ]
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/eskil/scurry"}
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:poison, "~> 5.0", only: :dev, runtime: false},
    ]
  end
end
