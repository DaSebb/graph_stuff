# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GraphStuff.Repo.insert!(%GraphStuff.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias GraphStuff.Animals.Animal
alias GraphStuff.Repo

%Animal{name: "cat", number_of_legs: 4, alive: false} |> Repo.insert!()
%Animal{name: "dog", number_of_legs: 3} |> Repo.insert!()
