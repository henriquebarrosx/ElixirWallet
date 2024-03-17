defmodule Wallet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WalletWeb.Telemetry,
      Wallet.Repo,
      {DNSCluster, query: Application.get_env(:wallet, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Wallet.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Wallet.Finch},
      # Start a worker by calling: Wallet.Worker.start_link(arg)
      # {Wallet.Worker, arg},
      # Start to serve requests, typically the last entry
      WalletWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wallet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WalletWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
