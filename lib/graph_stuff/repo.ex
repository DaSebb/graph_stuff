defmodule GraphStuff.Repo do
  use Ecto.Repo,
    otp_app: :graph_stuff,
    adapter: Ecto.Adapters.Postgres
end
