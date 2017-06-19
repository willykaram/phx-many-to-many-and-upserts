defmodule MyAppPhx.Web.PageController do
  use MyAppPhx.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
