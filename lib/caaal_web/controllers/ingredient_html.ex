defmodule CaaalWeb.IngredientHTML do
  use CaaalWeb, :html

  embed_templates "ingredient_html/*"

  @doc """
  Renders a ingredient form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def ingredient_form(assigns)
end
