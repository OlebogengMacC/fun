defmodule Fun.GS1.Domain do
  use Ecto.Schema
  import Ecto.Changeset

  schema "name" do

    timestamps()
  end

  @doc false
  def changeset(domain, attrs) do
    domain
    |> cast(attrs, [])
    |> validate_required([])
  end
end
