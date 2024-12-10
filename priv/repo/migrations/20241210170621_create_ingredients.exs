defmodule Caaal.Repo.Migrations.CreateIngredients do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :name, :text
      add :unit_type, :text

      timestamps(type: :utc_datetime)
    end
  end
end
