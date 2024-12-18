defmodule Caaal.CookBook do
  @moduledoc """
  The CookBook context.
  """

  import Ecto.Query, warn: false
  alias Caaal.Repo

  alias Caaal.CookBook.Recipe

  @doc """
  Returns the list of recipes.

  ## Examples

      iex> list_recipes()
      [%Recipe{}, ...]

  """
  def list_recipes(user) do
    Recipe
    |> where(user_id: ^user.id)
    |> Repo.all()
  end

  @doc """
  Gets a single recipe belonging to the given user.

  Raises `Ecto.NoResultsError` if the Recipe does not exist.

  ## Examples

      iex> get_recipe!(123)
      %Recipe{}

      iex> get_recipe!(456)
      ** (Ecto.NoResultsError)

  """
  def get_recipe!(user, id) do
    Recipe
    |> where(user_id: ^user.id)
    |> Repo.get!(id)
  end

  @doc """
  Creates a recipe.

  ## Examples

      iex> create_recipe(%{field: value})
      {:ok, %Recipe{}}

      iex> create_recipe(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_recipe(user, attrs \\ %{}) do
    %Recipe{}
    |> Recipe.changeset(Map.put(attrs, "user_id", user.id))
    |> Repo.insert()
  end

  @doc """
  Updates a recipe.

  ## Examples

      iex> update_recipe(recipe, %{field: new_value})
      {:ok, %Recipe{}}

      iex> update_recipe(recipe, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_recipe(%Recipe{} = recipe, attrs) do
    recipe
    |> Recipe.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a recipe.

  ## Examples

      iex> delete_recipe(recipe)
      {:ok, %Recipe{}}

      iex> delete_recipe(recipe)
      {:error, %Ecto.Changeset{}}

  """
  def delete_recipe(%Recipe{} = recipe) do
    Repo.delete(recipe)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking recipe changes.

  ## Examples

      iex> change_recipe(recipe)
      %Ecto.Changeset{data: %Recipe{}}

  """
  def change_recipe(%Recipe{} = recipe, attrs \\ %{}) do
    Recipe.changeset(recipe, attrs)
  end
end
