defmodule FunWeb.PageController do
  use FunWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
