defmodule AustinLvn.Repo do
  use Ecto.Repo,
    otp_app: :austin_lvn,
    adapter: Ecto.Adapters.Postgres
end
