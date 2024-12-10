defmodule Caaal.RecipeIngredientsTest do
  use Caaal.DataCase

  alias Caaal.RecipeIngredients

  describe "recipe_ingredients" do
    alias Caaal.RecipeIngredients.RecipeIngredient

    import Caaal.RecipeIngredientsFixtures

    @invalid_attrs %{name: nil}

    test "list_recipe_ingredients/0 returns all recipe_ingredients" do
      recipe_ingredient = recipe_ingredient_fixture()
      assert RecipeIngredients.list_recipe_ingredients() == [recipe_ingredient]
    end

    test "get_recipe_ingredient!/1 returns the recipe_ingredient with given id" do
      recipe_ingredient = recipe_ingredient_fixture()
      assert RecipeIngredients.get_recipe_ingredient!(recipe_ingredient.id) == recipe_ingredient
    end

    test "create_recipe_ingredient/1 with valid data creates a recipe_ingredient" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %RecipeIngredient{} = recipe_ingredient} = RecipeIngredients.create_recipe_ingredient(valid_attrs)
      assert recipe_ingredient.name == "some name"
    end

    test "create_recipe_ingredient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RecipeIngredients.create_recipe_ingredient(@invalid_attrs)
    end

    test "update_recipe_ingredient/2 with valid data updates the recipe_ingredient" do
      recipe_ingredient = recipe_ingredient_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %RecipeIngredient{} = recipe_ingredient} = RecipeIngredients.update_recipe_ingredient(recipe_ingredient, update_attrs)
      assert recipe_ingredient.name == "some updated name"
    end

    test "update_recipe_ingredient/2 with invalid data returns error changeset" do
      recipe_ingredient = recipe_ingredient_fixture()
      assert {:error, %Ecto.Changeset{}} = RecipeIngredients.update_recipe_ingredient(recipe_ingredient, @invalid_attrs)
      assert recipe_ingredient == RecipeIngredients.get_recipe_ingredient!(recipe_ingredient.id)
    end

    test "delete_recipe_ingredient/1 deletes the recipe_ingredient" do
      recipe_ingredient = recipe_ingredient_fixture()
      assert {:ok, %RecipeIngredient{}} = RecipeIngredients.delete_recipe_ingredient(recipe_ingredient)
      assert_raise Ecto.NoResultsError, fn -> RecipeIngredients.get_recipe_ingredient!(recipe_ingredient.id) end
    end

    test "change_recipe_ingredient/1 returns a recipe_ingredient changeset" do
      recipe_ingredient = recipe_ingredient_fixture()
      assert %Ecto.Changeset{} = RecipeIngredients.change_recipe_ingredient(recipe_ingredient)
    end
  end
end
