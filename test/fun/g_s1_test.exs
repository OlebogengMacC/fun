defmodule Fun.GS1Test do
  use Fun.DataCase

  alias Fun.GS1

  describe "name" do
    alias Fun.GS1.Domain

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def domain_fixture(attrs \\ %{}) do
      {:ok, domain} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GS1.create_domain()

      domain
    end

    test "list_name/0 returns all name" do
      domain = domain_fixture()
      assert GS1.list_name() == [domain]
    end

    test "get_domain!/1 returns the domain with given id" do
      domain = domain_fixture()
      assert GS1.get_domain!(domain.id) == domain
    end

    test "create_domain/1 with valid data creates a domain" do
      assert {:ok, %Domain{} = domain} = GS1.create_domain(@valid_attrs)
    end

    test "create_domain/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GS1.create_domain(@invalid_attrs)
    end

    test "update_domain/2 with valid data updates the domain" do
      domain = domain_fixture()
      assert {:ok, %Domain{} = domain} = GS1.update_domain(domain, @update_attrs)
    end

    test "update_domain/2 with invalid data returns error changeset" do
      domain = domain_fixture()
      assert {:error, %Ecto.Changeset{}} = GS1.update_domain(domain, @invalid_attrs)
      assert domain == GS1.get_domain!(domain.id)
    end

    test "delete_domain/1 deletes the domain" do
      domain = domain_fixture()
      assert {:ok, %Domain{}} = GS1.delete_domain(domain)
      assert_raise Ecto.NoResultsError, fn -> GS1.get_domain!(domain.id) end
    end

    test "change_domain/1 returns a domain changeset" do
      domain = domain_fixture()
      assert %Ecto.Changeset{} = GS1.change_domain(domain)
    end
  end

  describe "name" do
    alias Fun.GS1.ResourceSubType

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def resource_sub_type_fixture(attrs \\ %{}) do
      {:ok, resource_sub_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GS1.create_resource_sub_type()

      resource_sub_type
    end

    test "list_name/0 returns all name" do
      resource_sub_type = resource_sub_type_fixture()
      assert GS1.list_name() == [resource_sub_type]
    end

    test "get_resource_sub_type!/1 returns the resource_sub_type with given id" do
      resource_sub_type = resource_sub_type_fixture()
      assert GS1.get_resource_sub_type!(resource_sub_type.id) == resource_sub_type
    end

    test "create_resource_sub_type/1 with valid data creates a resource_sub_type" do
      assert {:ok, %ResourceSubType{} = resource_sub_type} = GS1.create_resource_sub_type(@valid_attrs)
    end

    test "create_resource_sub_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GS1.create_resource_sub_type(@invalid_attrs)
    end

    test "update_resource_sub_type/2 with valid data updates the resource_sub_type" do
      resource_sub_type = resource_sub_type_fixture()
      assert {:ok, %ResourceSubType{} = resource_sub_type} = GS1.update_resource_sub_type(resource_sub_type, @update_attrs)
    end

    test "update_resource_sub_type/2 with invalid data returns error changeset" do
      resource_sub_type = resource_sub_type_fixture()
      assert {:error, %Ecto.Changeset{}} = GS1.update_resource_sub_type(resource_sub_type, @invalid_attrs)
      assert resource_sub_type == GS1.get_resource_sub_type!(resource_sub_type.id)
    end

    test "delete_resource_sub_type/1 deletes the resource_sub_type" do
      resource_sub_type = resource_sub_type_fixture()
      assert {:ok, %ResourceSubType{}} = GS1.delete_resource_sub_type(resource_sub_type)
      assert_raise Ecto.NoResultsError, fn -> GS1.get_resource_sub_type!(resource_sub_type.id) end
    end

    test "change_resource_sub_type/1 returns a resource_sub_type changeset" do
      resource_sub_type = resource_sub_type_fixture()
      assert %Ecto.Changeset{} = GS1.change_resource_sub_type(resource_sub_type)
    end
  end

  describe "resource_sub_types" do
    alias Fun.GS1.ResourceSubType

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def resource_sub_type_fixture(attrs \\ %{}) do
      {:ok, resource_sub_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GS1.create_resource_sub_type()

      resource_sub_type
    end

    test "list_resource_sub_types/0 returns all resource_sub_types" do
      resource_sub_type = resource_sub_type_fixture()
      assert GS1.list_resource_sub_types() == [resource_sub_type]
    end

    test "get_resource_sub_type!/1 returns the resource_sub_type with given id" do
      resource_sub_type = resource_sub_type_fixture()
      assert GS1.get_resource_sub_type!(resource_sub_type.id) == resource_sub_type
    end

    test "create_resource_sub_type/1 with valid data creates a resource_sub_type" do
      assert {:ok, %ResourceSubType{} = resource_sub_type} = GS1.create_resource_sub_type(@valid_attrs)
      assert resource_sub_type.name == "some name"
    end

    test "create_resource_sub_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GS1.create_resource_sub_type(@invalid_attrs)
    end

    test "update_resource_sub_type/2 with valid data updates the resource_sub_type" do
      resource_sub_type = resource_sub_type_fixture()
      assert {:ok, %ResourceSubType{} = resource_sub_type} = GS1.update_resource_sub_type(resource_sub_type, @update_attrs)
      assert resource_sub_type.name == "some updated name"
    end

    test "update_resource_sub_type/2 with invalid data returns error changeset" do
      resource_sub_type = resource_sub_type_fixture()
      assert {:error, %Ecto.Changeset{}} = GS1.update_resource_sub_type(resource_sub_type, @invalid_attrs)
      assert resource_sub_type == GS1.get_resource_sub_type!(resource_sub_type.id)
    end

    test "delete_resource_sub_type/1 deletes the resource_sub_type" do
      resource_sub_type = resource_sub_type_fixture()
      assert {:ok, %ResourceSubType{}} = GS1.delete_resource_sub_type(resource_sub_type)
      assert_raise Ecto.NoResultsError, fn -> GS1.get_resource_sub_type!(resource_sub_type.id) end
    end

    test "change_resource_sub_type/1 returns a resource_sub_type changeset" do
      resource_sub_type = resource_sub_type_fixture()
      assert %Ecto.Changeset{} = GS1.change_resource_sub_type(resource_sub_type)
    end
  end
end
