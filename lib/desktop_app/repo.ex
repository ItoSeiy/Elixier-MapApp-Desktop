defmodule DesktopApp.Repo do
  use Ecto.Repo,
    otp_app: :desktop_app,
    adapter: Ecto.Adapters.Postgres
end
