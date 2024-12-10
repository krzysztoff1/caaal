defmodule Caaal.CookBookTest do
  use Caaal.DataCase

  alias Caaal.CookBook

  describe "recipes" do
    alias Caaal.CookBook.Recipe

    import Caaal.CookBookFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert CookBook.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert CookBook.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Recipe{} = recipe} = CookBook.create_recipe(valid_attrs)
      assert recipe.description == "some description"
      assert recipe.title == "some title"
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CookBook.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Recipe{} = recipe} = CookBook.update_recipe(recipe, update_attrs)
      assert recipe.description == "some updated description"
      assert recipe.title == "some updated title"
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = CookBook.update_recipe(recipe, @invalid_attrs)
      assert recipe == CookBook.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = CookBook.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> CookBook.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = CookBook.change_recipe(recipe)
    end
  end
end
