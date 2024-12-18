defmodule CaaalWeb.IngredientController do
  use CaaalWeb, :controller

  alias Caaal.Ingredients
  alias Caaal.Ingredients.Ingredient

  def index(conn, _params) do
    ingredients = Ingredients.list_ingredients()
    render(conn, :index, ingredients: ingredients)
  end

  def new(conn, _params) do
    changeset = Ingredients.change_ingredient(%Ingredient{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"ingredient" => ingredient_params}) do
    case Ingredients.create_ingredient(ingredient_params) do
      {:ok, ingredient} ->
        conn
        |> put_flash(:info, "Ingredient created successfully.")
        |> redirect(to: ~p"/ingredients/#{ingredient}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ingredient = Ingredients.get_ingredient!(id)
    render(conn, :show, ingredient: ingredient)
  end

  def edit(conn, %{"id" => id}) do
    ingredient = Ingredients.get_ingredient!(id)
    changeset = Ingredients.change_ingredient(ingredient)
    render(conn, :edit, ingredient: ingredient, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ingredient" => ingredient_params}) do
    ingredient = Ingredients.get_ingredient!(id)

    case Ingredients.update_ingredient(ingredient, ingredient_params) do
      {:ok, ingredient} ->
        conn
        |> put_flash(:info, "Ingredient updated successfully.")
        |> redirect(to: ~p"/ingredients/#{ingredient}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, ingredient: ingredient, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ingredient = Ingredients.get_ingredient!(id)
    {:ok, _ingredient} = Ingredients.delete_ingredient(ingredient)

    conn
    |> put_flash(:info, "Ingredient deleted successfully.")
    |> redirect(to: ~p"/ingredients")
  end
end
