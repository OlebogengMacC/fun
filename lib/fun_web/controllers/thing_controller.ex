defmodule FunWeb.ThingController do
  use FunWeb, :controller

  alias Fun.Generic
  alias Fun.Generic.Thing

  def index(conn, _params) do
    things = Generic.list_things()
    render(conn, "index.html", things: things)
  end

  def new(conn, _params) do
    changeset = Generic.change_thing(%Thing{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"thing" => thing_params}) do
    case Generic.create_thing(thing_params) do
      {:ok, thing} ->
        conn
        |> put_flash(:info, "Thing created successfully.")
        |> redirect(to: Routes.thing_path(conn, :show, thing))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    thing = Generic.get_thing!(id)
    render(conn, "show.html", thing: thing)
  end

  def edit(conn, %{"id" => id}) do
    thing = Generic.get_thing!(id)
    changeset = Generic.change_thing(thing)
    render(conn, "edit.html", thing: thing, changeset: changeset)
  end

  def update(conn, %{"id" => id, "thing" => thing_params}) do
    thing = Generic.get_thing!(id)

    case Generic.update_thing(thing, thing_params) do
      {:ok, thing} ->
        conn
        |> put_flash(:info, "Thing updated successfully.")
        |> redirect(to: Routes.thing_path(conn, :show, thing))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", thing: thing, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    thing = Generic.get_thing!(id)
    {:ok, _thing} = Generic.delete_thing(thing)

    conn
    |> put_flash(:info, "Thing deleted successfully.")
    |> redirect(to: Routes.thing_path(conn, :index))
  end
end
