defmodule CaaalWeb.PageController do
  use CaaalWeb, :controller

  alias Caaal.CookBook

  @spec home(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def home(conn, _params) do
    recipes = CookBook.list_recipes()

    render(conn, :home, recipes: recipes)
  end
end
