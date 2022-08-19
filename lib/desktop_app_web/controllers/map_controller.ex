defmodule DesktopAppWeb.MapController do
  use DesktopAppWeb, :controller
  alias DesktopApp.Locations.Location
  alias DesktopApp.Locations

  def index(conn, _params) do
    locations = Locations.get_locations()
    render(conn, "index.html", locations: locations)
  end

  def new(conn, _params) do
    changeset = Location.changeset(%Location{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"location" => attrs}) do
    case Locations.create(attrs) do
      {:ok, _location} ->
        conn
        |> put_flash(:info, "座標が登録できました。")
        |> redirect(to: Routes.map_path(conn, :index))

      {:error, cs} ->
        render(conn, "new.html", changeset: cs)
    end
  end

  def show(conn, %{"id" => id}) do
    location = Locations.get_location(id)
    render(conn, "show.html", location: location)
  end

  def edit(conn, %{"id" => id}) do
    location = Locations.get_location(id)
    changeset = Location.changeset(location, %{})
    render(conn, "edit.html", location: location, changeset: changeset)
  end

  def update(conn, %{"id" => id, "location" => attrs}) do
    location = Locations.get_location(id)
    case Locations.update_location(location, attrs) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "編集しました。")
        |> redirect(to: Routes.map_path(conn, :show, location))

      {:error, cs} ->
        render(conn, "edit.html", location: location, changeset: cs)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = Locations.get_location(id)
    {:ok, _location} = Locations.delete_location(location)

    conn
    |> put_flash(:info, "削除しました。")
    |> redirect(to: Routes.map_path(conn, :index))
  end
end
