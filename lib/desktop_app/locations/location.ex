defmodule DesktopApp.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :lat, :float, default: 0.0
    field :long, :float, default: 0.0
    field :location_name, :string, default: ""

    timestamps()
  end

  def changeset(location, attrs) do
    location
    |> cast(attrs, [:lat, :long, :location_name])
    |> validate_required([:lat, :long, :location_name])
  end
end
