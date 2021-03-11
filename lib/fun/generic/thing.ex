defmodule Fun.Generic.Thing do
  use Ecto.Schema
  import Ecto.Changeset

  schema "things" do
    field :alternate_name, :string
    field :description, :string
    field :disambiguating_description, :string
    field :identifier, :string
    field :image, :string
    field :name, :string
    field :same_as, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(thing, attrs) do
    thing
    |> cast(attrs, [:name, :alternate_name, :description, :disambiguating_description, :identifier, :image, :same_as, :url])
    |> validate_required([:name, :alternate_name, :description, :disambiguating_description, :identifier, :image, :same_as, :url])
  end
end
