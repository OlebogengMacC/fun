defmodule Fun.GenericTest do
  use Fun.DataCase

  alias Fun.Generic

  describe "things" do
    alias Fun.Generic.Thing

    @valid_attrs %{alternate_name: "some alternate_name", description: "some description", disambiguating_description: "some disambiguating_description", identifier: "some identifier", image: "some image", name: "some name", same_as: "some same_as", url: "some url"}
    @update_attrs %{alternate_name: "some updated alternate_name", description: "some updated description", disambiguating_description: "some updated disambiguating_description", identifier: "some updated identifier", image: "some updated image", name: "some updated name", same_as: "some updated same_as", url: "some updated url"}
    @invalid_attrs %{alternate_name: nil, description: nil, disambiguating_description: nil, identifier: nil, image: nil, name: nil, same_as: nil, url: nil}

    def thing_fixture(attrs \\ %{}) do
      {:ok, thing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Generic.create_thing()

      thing
    end

    test "list_things/0 returns all things" do
      thing = thing_fixture()
      assert Generic.list_things() == [thing]
    end

    test "get_thing!/1 returns the thing with given id" do
      thing = thing_fixture()
      assert Generic.get_thing!(thing.id) == thing
    end

    test "create_thing/1 with valid data creates a thing" do
      assert {:ok, %Thing{} = thing} = Generic.create_thing(@valid_attrs)
      assert thing.alternate_name == "some alternate_name"
      assert thing.description == "some description"
      assert thing.disambiguating_description == "some disambiguating_description"
      assert thing.identifier == "some identifier"
      assert thing.image == "some image"
      assert thing.name == "some name"
      assert thing.same_as == "some same_as"
      assert thing.url == "some url"
    end

    test "create_thing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Generic.create_thing(@invalid_attrs)
    end

    test "update_thing/2 with valid data updates the thing" do
      thing = thing_fixture()
      assert {:ok, %Thing{} = thing} = Generic.update_thing(thing, @update_attrs)
      assert thing.alternate_name == "some updated alternate_name"
      assert thing.description == "some updated description"
      assert thing.disambiguating_description == "some updated disambiguating_description"
      assert thing.identifier == "some updated identifier"
      assert thing.image == "some updated image"
      assert thing.name == "some updated name"
      assert thing.same_as == "some updated same_as"
      assert thing.url == "some updated url"
    end

    test "update_thing/2 with invalid data returns error changeset" do
      thing = thing_fixture()
      assert {:error, %Ecto.Changeset{}} = Generic.update_thing(thing, @invalid_attrs)
      assert thing == Generic.get_thing!(thing.id)
    end

    test "delete_thing/1 deletes the thing" do
      thing = thing_fixture()
      assert {:ok, %Thing{}} = Generic.delete_thing(thing)
      assert_raise Ecto.NoResultsError, fn -> Generic.get_thing!(thing.id) end
    end

    test "change_thing/1 returns a thing changeset" do
      thing = thing_fixture()
      assert %Ecto.Changeset{} = Generic.change_thing(thing)
    end
  end
end
