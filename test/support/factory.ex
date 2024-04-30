defmodule GraphStuff.Factory do
  alias GraphStuff.Animals.Animal
  use ExMachina.Ecto, repo: GraphStuff.Repo

  def animal_factory do
    %Animal{
      name: "dog_bruno",
      alive: true,
      number_of_legs: 4
    }
  end
end
