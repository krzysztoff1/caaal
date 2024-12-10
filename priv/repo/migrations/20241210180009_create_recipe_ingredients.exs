defmodule Caaal.Repo.Migrations.CreateRecipeIngredients do
  use Ecto.Migration

  def change do
    create table(:recipe_ingredients) do
      add :recipe_id, references(:recipes)
      add :ingredient_id, references(:ingredients)
      add :quantity, :float

      timestamps(type: :utc_datetime)
    end
  end
end
