defmodule CaaalWeb.PageController do
  use CaaalWeb, :controller

  alias Caaal.CookBook

  @spec home(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def home(conn, _params) do
    current_user = conn.assigns.current_user
    recipes = CookBook.list_recipes(current_user)

    render(conn, :home, recipes: recipes)
  end
end
