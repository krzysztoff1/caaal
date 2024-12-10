defmodule Caaal.RecipeIngredients do
  @moduledoc """
  The RecipeIngredients context.
  """

  import Ecto.Query, warn: false
  alias Caaal.Repo

  alias Caaal.RecipeIngredients.RecipeIngredient

  @doc """
  Returns the list of recipe_ingredients.

  ## Examples

      iex> list_recipe_ingredients()
      [%RecipeIngredient{}, ...]

  """
  def list_recipe_ingredients(recipe_id) do
    Repo.all(from(r in RecipeIngredient, where: r.recipe_id == ^recipe_id))
  end

  @doc """
  Gets a single recipe_ingredient.

  Raises `Ecto.NoResultsError` if the Recipe ingredient does not exist.

  ## Examples

      iex> get_recipe_ingredient!(123)
      %RecipeIngredient{}

      iex> get_recipe_ingredient!(456)
      ** (Ecto.NoResultsError)

  """
  def get_recipe_ingredient!(id), do: Repo.get!(RecipeIngredient, id)

  @doc """
  Creates a recipe_ingredient.

  ## Examples

      iex> create_recipe_ingredient(%{field: value})
      {:ok, %RecipeIngredient{}}

      iex> create_recipe_ingredient(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_recipe_ingredient(attrs \\ %{}) do
    %RecipeIngredient{}
    |> RecipeIngredient.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a recipe_ingredient.

  ## Examples

      iex> update_recipe_ingredient(recipe_ingredient, %{field: new_value})
      {:ok, %RecipeIngredient{}}

      iex> update_recipe_ingredient(recipe_ingredient, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_recipe_ingredient(%RecipeIngredient{} = recipe_ingredient, attrs) do
    recipe_ingredient
    |> RecipeIngredient.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a recipe_ingredient.

  ## Examples

      iex> delete_recipe_ingredient(recipe_ingredient)
      {:ok, %RecipeIngredient{}}

      iex> delete_recipe_ingredient(recipe_ingredient)
      {:error, %Ecto.Changeset{}}

  """
  def delete_recipe_ingredient(%RecipeIngredient{} = recipe_ingredient) do
    Repo.delete(recipe_ingredient)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking recipe_ingredient changes.

  ## Examples

      iex> change_recipe_ingredient(recipe_ingredient)
      %Ecto.Changeset{data: %RecipeIngredient{}}

  """
  def change_recipe_ingredient(%RecipeIngredient{} = recipe_ingredient, attrs \\ %{}) do
    RecipeIngredient.changeset(recipe_ingredient, attrs)
  end
end
