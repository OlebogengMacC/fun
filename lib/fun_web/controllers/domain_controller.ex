defmodule FunWeb.DomainController do
  use FunWeb, :controller

  alias Fun.GS1
  alias Fun.GS1.Domain

  def index(conn, _params) do
    name = GS1.list_name()
    render(conn, "index.html", name: name)
  end

  def new(conn, _params) do
    changeset = GS1.change_domain(%Domain{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"domain" => domain_params}) do
    case GS1.create_domain(domain_params) do
      {:ok, domain} ->
        conn
        |> put_flash(:info, "Domain created successfully.")
        |> redirect(to: Routes.domain_path(conn, :show, domain))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    domain = GS1.get_domain!(id)
    render(conn, "show.html", domain: domain)
  end

  def edit(conn, %{"id" => id}) do
    domain = GS1.get_domain!(id)
    changeset = GS1.change_domain(domain)
    render(conn, "edit.html", domain: domain, changeset: changeset)
  end

  def update(conn, %{"id" => id, "domain" => domain_params}) do
    domain = GS1.get_domain!(id)

    case GS1.update_domain(domain, domain_params) do
      {:ok, domain} ->
        conn
        |> put_flash(:info, "Domain updated successfully.")
        |> redirect(to: Routes.domain_path(conn, :show, domain))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", domain: domain, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    domain = GS1.get_domain!(id)
    {:ok, _domain} = GS1.delete_domain(domain)

    conn
    |> put_flash(:info, "Domain deleted successfully.")
    |> redirect(to: Routes.domain_path(conn, :index))
  end
end
