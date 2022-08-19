defmodule DesktopApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DesktopApp.Repo,
      # Start the Telemetry supervisor
      DesktopAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DesktopApp.PubSub},
      # Start the Endpoint (http/https)
      DesktopAppWeb.Endpoint,
      # Start a worker by calling: DesktopApp.Worker.start_link(arg)
      # {DesktopApp.Worker, arg}

      {
        Desktop.Window,
        [
            app: :desktop_app,
            id: DesktopAppWindow,
            url: &DesktopAppWeb.Endpoint.url/0
        ]
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DesktopApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DesktopAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
