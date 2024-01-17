defmodule AustinLvn.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AustinLvnWeb.Telemetry,
      AustinLvn.Repo,
      {DNSCluster, query: Application.get_env(:austin_lvn, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AustinLvn.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: AustinLvn.Finch},
      # Start a worker by calling: AustinLvn.Worker.start_link(arg)
      # {AustinLvn.Worker, arg},
      # Start to serve requests, typically the last entry
      AustinLvnWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AustinLvn.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AustinLvnWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
