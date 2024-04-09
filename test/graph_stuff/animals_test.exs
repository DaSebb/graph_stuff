defmodule GraphStuff.AnimalsTest do
  use GraphStuff.DataCase

  alias GraphStuff.Animals

  describe "animals" do
    alias GraphStuff.Animals.Animal

    import GraphStuff.AnimalsFixtures

    @invalid_attrs %{alive: nil, name: nil, number_of_legs: nil}

    test "list_animals/0 returns all animals" do
      animal = animal_fixture()
      assert Animals.list_animals() == [animal]
    end

    test "get_animal!/1 returns the animal with given id" do
      animal = animal_fixture()
      assert Animals.get_animal!(animal.id) == animal
    end

    test "create_animal/1 with valid data creates a animal" do
      valid_attrs = %{alive: true, name: "some name", number_of_legs: 42}

      assert {:ok, %Animal{} = animal} = Animals.create_animal(valid_attrs)
      assert animal.alive == true
      assert animal.name == "some name"
      assert animal.number_of_legs == 42
    end

    test "create_animal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animals.create_animal(@invalid_attrs)
    end

    test "update_animal/2 with valid data updates the animal" do
      animal = animal_fixture()
      update_attrs = %{alive: false, name: "some updated name", number_of_legs: 43}

      assert {:ok, %Animal{} = animal} = Animals.update_animal(animal, update_attrs)
      assert animal.alive == false
      assert animal.name == "some updated name"
      assert animal.number_of_legs == 43
    end

    test "update_animal/2 with invalid data returns error changeset" do
      animal = animal_fixture()
      assert {:error, %Ecto.Changeset{}} = Animals.update_animal(animal, @invalid_attrs)
      assert animal == Animals.get_animal!(animal.id)
    end

    test "delete_animal/1 deletes the animal" do
      animal = animal_fixture()
      assert {:ok, %Animal{}} = Animals.delete_animal(animal)
      assert_raise Ecto.NoResultsError, fn -> Animals.get_animal!(animal.id) end
    end

    test "change_animal/1 returns a animal changeset" do
      animal = animal_fixture()
      assert %Ecto.Changeset{} = Animals.change_animal(animal)
    end
  end
end
