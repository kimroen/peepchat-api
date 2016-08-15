defmodule Peepchat.UserTest do
  use Peepchat.ModelCase

  alias Peepchat.User

  @valid_attrs %{email: "kim@example.com", password: "abcde12345", password_confirmation: "abcde12345"}
  @invalid_attrs %{email: "mything", password: "1", password_confirmation: "owf"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{
      email: "joe@example.com",
      password: "293ghpoemsf",
      password_confirmation: "oiehgegh0"
    })

    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{
      email: "joe@example.com",
      password: "oiengoeg"
    })

    refute changeset.valid?
  end

  test "short password doesn't work" do
    changeset = User.changeset(%User{}, %{
      email: "joe@example.com",
      password: "51kfw",
      password_confirmation: "51kfw"
    })

    refute changeset.valid?
  end
end
