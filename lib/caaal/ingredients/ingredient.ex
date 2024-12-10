defmodule Caaal.Ingredients.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  @unit_types ["grams", "cups", "pieces"]

  schema "ingredients" do
    field :name, :string
    field :unit_type, :string

    timestamps()
  end

  def unit_types, do: @unit_types

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:name, :unit_type])
    |> validate_required([:name, :unit_type])
    |> validate_inclusion(:unit_type, @unit_types, message: "must be one of: #{Enum.join(@unit_types, ", ")}")
  end
end
