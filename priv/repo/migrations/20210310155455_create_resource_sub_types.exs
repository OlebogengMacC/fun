defmodule Fun.Repo.Migrations.CreateResourceSubTypes do
  use Ecto.Migration

  def change do
    create table(:resource_sub_types) do
      add :name, :string

      timestamps()
    end

  end
end
