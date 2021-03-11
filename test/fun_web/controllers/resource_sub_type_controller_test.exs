defmodule FunWeb.ResourceSubTypeControllerTest do
  use FunWeb.ConnCase

  alias Fun.GS1

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:resource_sub_type) do
    {:ok, resource_sub_type} = GS1.create_resource_sub_type(@create_attrs)
    resource_sub_type
  end

  describe "index" do
    test "lists all resource_sub_types", %{conn: conn} do
      conn = get(conn, Routes.resource_sub_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Resource sub types"
    end
  end

  describe "new resource_sub_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.resource_sub_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Resource sub type"
    end
  end

  describe "create resource_sub_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.resource_sub_type_path(conn, :create), resource_sub_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.resource_sub_type_path(conn, :show, id)

      conn = get(conn, Routes.resource_sub_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Resource sub type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.resource_sub_type_path(conn, :create), resource_sub_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Resource sub type"
    end
  end

  describe "edit resource_sub_type" do
    setup [:create_resource_sub_type]

    test "renders form for editing chosen resource_sub_type", %{conn: conn, resource_sub_type: resource_sub_type} do
      conn = get(conn, Routes.resource_sub_type_path(conn, :edit, resource_sub_type))
      assert html_response(conn, 200) =~ "Edit Resource sub type"
    end
  end

  describe "update resource_sub_type" do
    setup [:create_resource_sub_type]

    test "redirects when data is valid", %{conn: conn, resource_sub_type: resource_sub_type} do
      conn = put(conn, Routes.resource_sub_type_path(conn, :update, resource_sub_type), resource_sub_type: @update_attrs)
      assert redirected_to(conn) == Routes.resource_sub_type_path(conn, :show, resource_sub_type)

      conn = get(conn, Routes.resource_sub_type_path(conn, :show, resource_sub_type))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, resource_sub_type: resource_sub_type} do
      conn = put(conn, Routes.resource_sub_type_path(conn, :update, resource_sub_type), resource_sub_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Resource sub type"
    end
  end

  describe "delete resource_sub_type" do
    setup [:create_resource_sub_type]

    test "deletes chosen resource_sub_type", %{conn: conn, resource_sub_type: resource_sub_type} do
      conn = delete(conn, Routes.resource_sub_type_path(conn, :delete, resource_sub_type))
      assert redirected_to(conn) == Routes.resource_sub_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.resource_sub_type_path(conn, :show, resource_sub_type))
      end
    end
  end

  defp create_resource_sub_type(_) do
    resource_sub_type = fixture(:resource_sub_type)
    %{resource_sub_type: resource_sub_type}
  end
end
