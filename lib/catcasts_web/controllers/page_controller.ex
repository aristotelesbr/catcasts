defmodule CatcastsWeb.PageController do
  use CatcastsWeb, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Isso é um teste")
    |> render("index.html")
  end
end
