defmodule Caaal.CookBookFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Caaal.CookBook` context.
  """

  @doc """
  Generate a recipe.
  """
  def recipe_fixture(attrs \\ %{}) do
    {:ok, recipe} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Caaal.CookBook.create_recipe()

    recipe
  end
end
