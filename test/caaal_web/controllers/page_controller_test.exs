defmodule CaaalWeb.PageControllerTest do
  use CaaalWeb.ConnCase

  import CaaalWeb.UserAuth

  test "GET / redirects if user is not logged in", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert redirected_to(conn) == ~p"/users/log_in"
  end

  test "GET / shows page if user is logged in", %{conn: conn} do
    user = %{id: 1, email: "test@example.com"}

    conn =
      conn
      |> assign(:current_user, user)
      |> init_test_session(%{})
      |> fetch_current_user([])
      |> get(~p"/")

    assert html_response(conn, 200) =~ "Recipes"
  end
end
