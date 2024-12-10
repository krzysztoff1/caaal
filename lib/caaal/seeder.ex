alias Caaal.Repo

defmodule Caaal.Seeder do
  def seed do
    IO.puts("Seeding database...")

    ingredients = [
      %{name: "Skyr", unit_type: "gram"},
      %{name: "Milk", unit_type: "gram"},
      %{name: "Sugar", unit_type: "gram"},
      %{name: "Flour", unit_type: "gram"},
      %{name: "Butter", unit_type: "gram"},
      %{name: "Eggs", unit_type: "gram"},
      %{name: "Salt", unit_type: "gram"},
      %{name: "Pepper", unit_type: "gram"},
      %{name: "Garlic", unit_type: "gram"},
      %{name: "Onion", unit_type: "gram"},
      %{name: "Tomato", unit_type: "gram"},
      %{name: "Potato", unit_type: "gram"},
      %{name: "Carrot", unit_type: "gram"},
      %{name: "Cucumber", unit_type: "gram"},
      %{name: "Lettuce", unit_type: "gram"},
      %{name: "Chicken", unit_type: "gram"},
      %{name: "Beef", unit_type: "gram"},
      %{name: "Fish", unit_type: "gram"},
      %{name: "Rice", unit_type: "gram"},
      %{name: "Pasta", unit_type: "gram"},
      %{name: "Pizza", unit_type: "gram"},
      %{name: "Salad", unit_type: "gram"},
    ]

    Enum.each(ingredients, fn ingredient ->
      if Caaal.Repo.exists?(Caaal.Ingredients.Ingredient, name: ingredient.name) do
        IO.puts("Ingredient #{ingredient.name} already exists")
      else
        Caaal.Repo.insert!(%Caaal.Ingredients.Ingredient{name: ingredient.name, unit_type: ingredient.unit_type})
        IO.puts("Ingredient #{ingredient.name} created")
      end
    end)

    IO.puts("Database seeded")
  end
end
