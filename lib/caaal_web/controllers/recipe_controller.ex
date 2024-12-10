defmodule CaaalWeb.RecipeController do
  use CaaalWeb, :controller

  alias Caaal.CookBook
  alias Caaal.CookBook.Recipe
  alias Caaal.Ingredients
  alias Caaal.RecipeIngredients

  def index(conn, _params) do
    current_user = conn.assigns.current_user
    recipes = CookBook.list_recipes(current_user)
    render(conn, :index, recipes: recipes)
  end

  def new(conn, _params) do
    changeset = CookBook.change_recipe(%Recipe{})
    ingredients = Ingredients.list_ingredients() |> Enum.map(&{&1.name, &1.id})

    render(conn, :new, changeset: changeset, ingredients: ingredients)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    current_user = conn.assigns.current_user

    case CookBook.create_recipe(current_user, recipe_params) do
      {:ok, recipe} ->
        ingredients_params = recipe_params["ingredient_ids"] || []

        Enum.each(ingredients_params, fn ingredient_id ->
          IO.inspect("ingredient_id")
          IO.inspect(ingredient_id)

          RecipeIngredients.create_recipe_ingredient(%{
            recipe_id: recipe.id,
            ingredient_id: ingredient_id,
            quantity: 1.0
          })
        end)

        conn
        |> put_flash(:info, "Recipe created successfully.")
        |> redirect(to: ~p"/recipes/#{recipe}")

      {:error, %Ecto.Changeset{} = changeset} ->
        ingredients = Ingredients.list_ingredients() |> Enum.map(&{&1.name, &1.id})
        render(conn, :new, changeset: changeset, ingredients: ingredients)
    end
  end

  def show(conn, %{"id" => id}) do
    current_user = conn.assigns.current_user

    recipe =
      CookBook.get_recipe!(current_user, id)
      |> Caaal.Repo.preload(recipe_ingredients: [:ingredient])

    render(conn, :show, recipe: recipe)
  end

  def edit(conn, %{"id" => id}) do
    current_user = conn.assigns.current_user
    recipe = CookBook.get_recipe!(current_user, id)
    changeset = CookBook.change_recipe(recipe)
    ingredients = Ingredients.list_ingredients() |> Enum.map(&{&1.name, &1.id})

    render(conn, :edit, recipe: recipe, changeset: changeset, ingredients: ingredients)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    current_user = conn.assigns.current_user
    recipe = CookBook.get_recipe!(current_user, id)

    case CookBook.update_recipe(recipe, recipe_params) do
      {:ok, recipe} ->
        existing_recipe_ingredients = RecipeIngredients.list_recipe_ingredients(recipe.id)
        Enum.each(existing_recipe_ingredients, &RecipeIngredients.delete_recipe_ingredient/1)
        ingredient_ids = recipe_params["ingredient_ids"] || []
        IO.inspect("ingredient_ids")
        IO.inspect(ingredient_ids)

        Enum.each(ingredient_ids, fn ingredient_id ->
          IO.inspect("ingredient_id")
          IO.inspect(ingredient_id)

          RecipeIngredients.create_recipe_ingredient(%{
            recipe_id: recipe.id,
            ingredient_id: ingredient_id,
            quantity: 1.0
          })
        end)

        conn
        |> put_flash(:info, "Recipe updated successfully.")
        |> redirect(to: ~p"/recipes/#{recipe}")

      {:error, %Ecto.Changeset{} = changeset} ->
        ingredients = Ingredients.list_ingredients() |> Enum.map(&{&1.name, &1.id})
        render(conn, :edit, recipe: recipe, changeset: changeset, ingredients: ingredients)
    end
  end

  def delete(conn, %{"id" => id}) do
    current_user = conn.assigns.current_user
    recipe = CookBook.get_recipe!(current_user, id)
    {:ok, _recipe} = CookBook.delete_recipe(recipe)

    conn
    |> put_flash(:info, "Recipe deleted successfully.")
    |> redirect(to: ~p"/recipes")
  end
end
