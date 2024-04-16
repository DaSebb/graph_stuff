defmodule GraphStuff.Animals.Animal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "animals" do
    field :alive, :boolean, default: true
    field :name, :string
    field :number_of_legs, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(animal, attrs) do
    animal
    |> cast(attrs, [:name, :alive, :number_of_legs])
    |> validate_required([:name, :alive, :number_of_legs])
  end
end
