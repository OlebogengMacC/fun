defmodule Fun.Repo.Migrations.CreateName do
  use Ecto.Migration

  def change do
    create table(:name) do

      timestamps()
    end

  end
end
