defmodule Exts.Mixfile do
  use Mix.Project

  def project do
    [ app: :exts,
      version: "0.0.1",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ mod: { Exts.Manager, [] } ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [ { :resource, %r(.*), github: "tonyrog/resource" } ]
  end
end
