defmodule Fun.Repo.Migrations.CreateThings do
  use Ecto.Migration

  def change do
    create table(:things) do
      add :name, :string
      add :alternate_name, :string
      add :description, :text
      add :disambiguating_description, :text
      add :identifier, :string
      add :image, :string
      add :same_as, :string
      add :url, :string

      timestamps()
    end

  end
end
