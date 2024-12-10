defmodule Caaal.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
