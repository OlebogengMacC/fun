defmodule Fun.GS1 do
  @moduledoc """
  The GS1 context.
  """

  import Ecto.Query, warn: false
  alias Fun.Repo

  alias Fun.GS1.Domain

  @doc """
  Returns the list of name.

  ## Examples

      iex> list_name()
      [%Domain{}, ...]

  """
  def list_name do
    Repo.all(Domain)
  end

  @doc """
  Gets a single domain.

  Raises `Ecto.NoResultsError` if the Domain does not exist.

  ## Examples

      iex> get_domain!(123)
      %Domain{}

      iex> get_domain!(456)
      ** (Ecto.NoResultsError)

  """
  def get_domain!(id), do: Repo.get!(Domain, id)

  @doc """
  Creates a domain.

  ## Examples

      iex> create_domain(%{field: value})
      {:ok, %Domain{}}

      iex> create_domain(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_domain(attrs \\ %{}) do
    %Domain{}
    |> Domain.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a domain.

  ## Examples

      iex> update_domain(domain, %{field: new_value})
      {:ok, %Domain{}}

      iex> update_domain(domain, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_domain(%Domain{} = domain, attrs) do
    domain
    |> Domain.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a domain.

  ## Examples

      iex> delete_domain(domain)
      {:ok, %Domain{}}

      iex> delete_domain(domain)
      {:error, %Ecto.Changeset{}}

  """
  def delete_domain(%Domain{} = domain) do
    Repo.delete(domain)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking domain changes.

  ## Examples

      iex> change_domain(domain)
      %Ecto.Changeset{data: %Domain{}}

  """
  def change_domain(%Domain{} = domain, attrs \\ %{}) do
    Domain.changeset(domain, attrs)
  end


  alias Fun.GS1.ResourceSubType

  @doc """
  Returns the list of resource_sub_types.

  ## Examples

      iex> list_resource_sub_types()
      [%ResourceSubType{}, ...]

  """
  def list_resource_sub_types do
    Repo.all(ResourceSubType)
  end

  @doc """
  Gets a single resource_sub_type.

  Raises `Ecto.NoResultsError` if the Resource sub type does not exist.

  ## Examples

      iex> get_resource_sub_type!(123)
      %ResourceSubType{}

      iex> get_resource_sub_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resource_sub_type!(id), do: Repo.get!(ResourceSubType, id)

  @doc """
  Creates a resource_sub_type.

  ## Examples

      iex> create_resource_sub_type(%{field: value})
      {:ok, %ResourceSubType{}}

      iex> create_resource_sub_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resource_sub_type(attrs \\ %{}) do
    %ResourceSubType{}
    |> ResourceSubType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resource_sub_type.

  ## Examples

      iex> update_resource_sub_type(resource_sub_type, %{field: new_value})
      {:ok, %ResourceSubType{}}

      iex> update_resource_sub_type(resource_sub_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resource_sub_type(%ResourceSubType{} = resource_sub_type, attrs) do
    resource_sub_type
    |> ResourceSubType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a resource_sub_type.

  ## Examples

      iex> delete_resource_sub_type(resource_sub_type)
      {:ok, %ResourceSubType{}}

      iex> delete_resource_sub_type(resource_sub_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resource_sub_type(%ResourceSubType{} = resource_sub_type) do
    Repo.delete(resource_sub_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resource_sub_type changes.

  ## Examples

      iex> change_resource_sub_type(resource_sub_type)
      %Ecto.Changeset{data: %ResourceSubType{}}

  """
  def change_resource_sub_type(%ResourceSubType{} = resource_sub_type, attrs \\ %{}) do
    ResourceSubType.changeset(resource_sub_type, attrs)
  end
end
