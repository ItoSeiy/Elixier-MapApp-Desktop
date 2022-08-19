defmodule DesktopAppWeb.PageController do
  use DesktopAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
