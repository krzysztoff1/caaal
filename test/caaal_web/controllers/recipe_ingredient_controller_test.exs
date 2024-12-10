defmodule CaaalWeb.RecipeIngredientControllerTest do
  use CaaalWeb.ConnCase

  import Caaal.RecipeIngredientsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all recipe_ingredients", %{conn: conn} do
      conn = get(conn, ~p"/recipe_ingredients")
      assert html_response(conn, 200) =~ "Listing Recipe ingredients"
    end
  end

  describe "new recipe_ingredient" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/recipe_ingredients/new")
      assert html_response(conn, 200) =~ "New Recipe ingredient"
    end
  end

  describe "create recipe_ingredient" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/recipe_ingredients", recipe_ingredient: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/recipe_ingredients/#{id}"

      conn = get(conn, ~p"/recipe_ingredients/#{id}")
      assert html_response(conn, 200) =~ "Recipe ingredient #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/recipe_ingredients", recipe_ingredient: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Recipe ingredient"
    end
  end

  describe "edit recipe_ingredient" do
    setup [:create_recipe_ingredient]

    test "renders form for editing chosen recipe_ingredient", %{conn: conn, recipe_ingredient: recipe_ingredient} do
      conn = get(conn, ~p"/recipe_ingredients/#{recipe_ingredient}/edit")
      assert html_response(conn, 200) =~ "Edit Recipe ingredient"
    end
  end

  describe "update recipe_ingredient" do
    setup [:create_recipe_ingredient]

    test "redirects when data is valid", %{conn: conn, recipe_ingredient: recipe_ingredient} do
      conn = put(conn, ~p"/recipe_ingredients/#{recipe_ingredient}", recipe_ingredient: @update_attrs)
      assert redirected_to(conn) == ~p"/recipe_ingredients/#{recipe_ingredient}"

      conn = get(conn, ~p"/recipe_ingredients/#{recipe_ingredient}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, recipe_ingredient: recipe_ingredient} do
      conn = put(conn, ~p"/recipe_ingredients/#{recipe_ingredient}", recipe_ingredient: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Recipe ingredient"
    end
  end

  describe "delete recipe_ingredient" do
    setup [:create_recipe_ingredient]

    test "deletes chosen recipe_ingredient", %{conn: conn, recipe_ingredient: recipe_ingredient} do
      conn = delete(conn, ~p"/recipe_ingredients/#{recipe_ingredient}")
      assert redirected_to(conn) == ~p"/recipe_ingredients"

      assert_error_sent 404, fn ->
        get(conn, ~p"/recipe_ingredients/#{recipe_ingredient}")
      end
    end
  end

  defp create_recipe_ingredient(_) do
    recipe_ingredient = recipe_ingredient_fixture()
    %{recipe_ingredient: recipe_ingredient}
  end
end
