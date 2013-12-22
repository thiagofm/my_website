defmodule MyWebsite.Mixfile do
  use Mix.Project

  def project do
    [ app: :my_website,
      version: "0.0.1",
      build_per_environment: true,
      dynamos: [MyWebsite.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { MyWebsite, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "~> 0.1.0-dev", github: "elixir-lang/dynamo" } ]
  end
end
