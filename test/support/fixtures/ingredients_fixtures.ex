defmodule Caaal.IngredientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Caaal.Ingredients` context.
  """

  @doc """
  Generate a ingredient.
  """
  def ingredient_fixture(attrs \\ %{}) do
    {:ok, ingredient} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Caaal.Ingredients.create_ingredient()

    ingredient
  end
end
