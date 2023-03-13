defmodule Scurry.MixProject do
  use Mix.Project

  def project do
    [
      name: "Scurry",
      description: description(),
      package: package(),
      aliases: aliases(),
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
        extras: ["Quickstart.md"]
      ]
    ]
  end

  defp description() do
    "An A-star 2D polygon map search implementation and library for Elixir"
  end

  defp aliases do
    [docs: [&copy_md_files/1, "docs", &copy_imgs/1]]
  end

  defp copy_md_files(_) do
    File.cp!("Quickstart.md", "doc/Quickstart.md")
  end

  defp copy_imgs(_) do
    File.cp!("imgs/polygon.png", "doc/polygon.png")
    File.cp!("imgs/quickstart.png", "doc/quickstart.png")
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
