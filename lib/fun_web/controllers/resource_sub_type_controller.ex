defmodule FunWeb.ResourceSubTypeController do
  use FunWeb, :controller

  alias Fun.GS1
  alias Fun.GS1.ResourceSubType

  def index(conn, _params) do
    resource_sub_types = GS1.list_resource_sub_types()
    render(conn, "index.html", resource_sub_types: resource_sub_types)
  end

  def new(conn, _params) do
    changeset = GS1.change_resource_sub_type(%ResourceSubType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"resource_sub_type" => resource_sub_type_params}) do
    case GS1.create_resource_sub_type(resource_sub_type_params) do
      {:ok, resource_sub_type} ->
        conn
        |> put_flash(:info, "Resource sub type created successfully.")
        |> redirect(to: Routes.resource_sub_type_path(conn, :show, resource_sub_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resource_sub_type = GS1.get_resource_sub_type!(id)
    render(conn, "show.html", resource_sub_type: resource_sub_type)
  end

  def edit(conn, %{"id" => id}) do
    resource_sub_type = GS1.get_resource_sub_type!(id)
    changeset = GS1.change_resource_sub_type(resource_sub_type)
    render(conn, "edit.html", resource_sub_type: resource_sub_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resource_sub_type" => resource_sub_type_params}) do
    resource_sub_type = GS1.get_resource_sub_type!(id)

    case GS1.update_resource_sub_type(resource_sub_type, resource_sub_type_params) do
      {:ok, resource_sub_type} ->
        conn
        |> put_flash(:info, "Resource sub type updated successfully.")
        |> redirect(to: Routes.resource_sub_type_path(conn, :show, resource_sub_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", resource_sub_type: resource_sub_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resource_sub_type = GS1.get_resource_sub_type!(id)
    {:ok, _resource_sub_type} = GS1.delete_resource_sub_type(resource_sub_type)

    conn
    |> put_flash(:info, "Resource sub type deleted successfully.")
    |> redirect(to: Routes.resource_sub_type_path(conn, :index))
  end
end
