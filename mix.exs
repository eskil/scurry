defmodule Scurry.MixProject do
  use Mix.Project

  def project do
    [
      name: "Scurry",
      description: description(),
      package: package(),
      aliases: aliases(),
      app: :scurry,
      version: "3.0.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [plt_add_apps: [:poison]],
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
      ],
    ]
  end

  defp description() do
    "An A-star 2D polygon map search implementation and library for Elixir"
  end

  defp aliases do
    [docs: [&copy_md_files/1, "docs", &copy_imgs/1]]
  end

  defp copy_md_files(_) do
    File.mkdir("doc")
    File.cp!("Quickstart.md", "doc/Quickstart.md")
  end

  defp copy_imgs(_) do
    File.mkdir("doc/imgs")
    File.cp!("imgs/polygon.png", "doc/imgs/polygon.png")
    File.cp!("imgs/quickstart.png", "doc/imgs/quickstart.png")
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
      {:ex_doc, "~> 0.31", only: :dev, runtime: false},
      {:excoveralls, "~> 0.18", only: :test},
      {:poison, "~> 6.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
    ]
  end
end
