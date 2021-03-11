defmodule Fun.GS1.ResourceSubType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "resource_sub_types" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(resource_sub_type, attrs) do
    resource_sub_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
