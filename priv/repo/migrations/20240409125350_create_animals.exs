defmodule GraphStuff.Repo.Migrations.CreateAnimals do
  use Ecto.Migration

  def change do
    create table(:animals) do
      add :name, :string
      add :alive, :boolean, default: true, null: false
      add :number_of_legs, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
