defmodule FunWeb.Helpers.IconHelper do
  @moduledoc """
  Give icons to be used on templates
  """
  use Phoenix.HTML
  alias FunWeb.Router.Helpers, as: Routes

  @doc """
  Template to be used
  """
  def icon_tag(conn, name, opts \\ []) do
    classes = Keyword.get(opts, :class, "") <> " icon"

    content_tag(:svg, class: classes) do
      tag(:use, "xlink:href": Routes.static_path(conn, "/icons/zondicons/" <> name <> ".svg"))
    end
  end
end
