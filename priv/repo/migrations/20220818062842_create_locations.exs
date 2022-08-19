defmodule DesktopApp.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :lat, :float
      add :long, :float
      add :location_name, :string

      timestamps()
    end
  end
end
