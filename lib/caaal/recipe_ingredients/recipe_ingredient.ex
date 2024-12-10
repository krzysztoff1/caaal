defmodule Caaal.RecipeIngredients.RecipeIngredient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipe_ingredients" do
    field :quantity, :float
    belongs_to :recipe, Caaal.CookBook.Recipe
    belongs_to :ingredient, Caaal.Ingredients.Ingredient

    timestamps()
  end

  @doc false
  def changeset(recipe_ingredient, attrs) do
    recipe_ingredient
    |> cast(attrs, [:quantity, :recipe_id, :ingredient_id])
    |> validate_required([:quantity, :recipe_id, :ingredient_id])
    |> foreign_key_constraint(:recipe_id)
    |> foreign_key_constraint(:ingredient_id)
  end
end
