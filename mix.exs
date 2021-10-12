defmodule ISO.MixProject do
  use Mix.Project

  def project do
    [
      app: :iso,
      version: "1.2.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  defp description do
    """
    Provides a module that supplies ISO-3166 country data.
    """
  end

  defp package do
    [
      name: :iso,
      files: [
        "lib/iso.ex",
        "lib/iso",
        "priv/iso-3166-2.json",
        "mix.exs",
        "README.md",
        "LICENSE"
      ],
      maintainers: ["Nick Kezhaya"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/whitepaperclip/iso"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [extra_applications: [:logger]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:jason, "~> 1.2"},
      {:csv, "~> 2.4", optional: true, only: [:dev]}
    ]
  end
end
