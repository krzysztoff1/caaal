defmodule Caaal.Repo do
  use Ecto.Repo,
    otp_app: :caaal,
    adapter: Ecto.Adapters.Postgres
end
