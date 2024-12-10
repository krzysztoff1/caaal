defmodule CaaalWeb.RecipeController do
  use CaaalWeb, :controller

  alias Caaal.CookBook
  alias Caaal.CookBook.Recipe
  alias Caaal.Accounts.User

  def index(conn, _params) do
    current_user = conn.assigns.current_user
    recipes = CookBook.list_recipes(current_user)
    render(conn, :index, recipes: recipes)
  end

  def new(conn, _params) do
    changeset = CookBook.change_recipe(%Recipe{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    current_user = conn.assigns.current_user
    case CookBook.create_recipe(current_user, recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe created successfully.")
        |> redirect(to: ~p"/recipes/#{recipe}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    current_user = conn.assigns.current_user
    recipe = CookBook.get_recipe!(current_user, id)
    render(conn, :show, recipe: recipe)
  end

  def edit(conn, %{"id" => id}) do
    current_user = conn.assigns.current_user
    recipe = CookBook.get_recipe!(current_user, id)
    changeset = CookBook.change_recipe(recipe)
    render(conn, :edit, recipe: recipe, changeset: changeset)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    current_user = conn.assigns.current_user
    recipe = CookBook.get_recipe!(current_user, id)

    case CookBook.update_recipe(recipe, recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe updated successfully.")
        |> redirect(to: ~p"/recipes/#{recipe}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, recipe: recipe, changeset: changeset)
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
