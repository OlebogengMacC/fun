defmodule Fun.Repo do
  use Ecto.Repo,
    otp_app: :fun,
    adapter: Ecto.Adapters.Postgres
end
