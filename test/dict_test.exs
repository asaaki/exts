Code.require_file "../test_helper.exs", __FILE__

defmodule DictTest do
  use ExUnit.Case

  test "creation works" do
    t = Exts.Dict.new

    assert is_integer t.to_table.id
  end

  test "put works" do
    t = Exts.Dict.new

    Dict.put(t, :a, :foo)
    assert Dict.get(t, :a) == :foo
  end

  test "get works" do
    t = Exts.Dict.new

    assert Dict.get(t, :a) == nil
    assert Dict.get(t, :a, true) == true

    Dict.put(t, :a, :foo)
    assert Dict.get(t, :a) == :foo
  end

  test "update works" do
    t = Exts.Dict.new

    assert_raise KeyError, fn ->
      Dict.update(t, :a, fn(_) -> nil end)
    end

    Dict.put(t, :a, 2)
    Dict.update(t, :a, &1 * 2)
    assert Dict.get(t, :a) == 4
  end

  test "update works with a default parameter" do
    t = Exts.Dict.new

    Dict.update(t, :a, 2, &1 * 2)
    assert Dict.get(t, :a) == 4
  end

  test "delete works" do
    t = Exts.Dict.new

    Dict.put(t, :a, 2)
    assert Dict.get(t, :a) == 2

    Dict.delete(t, :a)
    assert Dict.get(t, :a) == nil
  end

  test "size works" do
    t = Exts.Dict.new

    assert Dict.size(t) == 0
    Dict.put(t, :a, 2)
    assert Dict.size(t) == 1
  end

  test "to_list works" do
    t = Exts.Dict.new

    assert Dict.to_list(t) == []
    Dict.put(t, :a, 2)
    assert Dict.to_list(t) == [a: 2]
  end

  test "keys works" do
    t = Exts.Dict.new

    assert Dict.keys(t) == []
    Dict.put(t, :a, 2)
    assert Dict.keys(t) == [:a]
  end

  test "values works" do
    t = Exts.Dict.new

    assert Dict.values(t) == []
    Dict.put(t, :a, 2)
    assert Dict.values(t) == [2]
  end

  test "iteration works" do
    t = Exts.Dict.new

    assert Enum.map(t, fn(x) -> x end) == []

    Dict.put(t, :a, 2)
    assert Enum.map(t, fn(x) -> x end) == [a: 2]
  end

  test "access works" do
    t = Exts.Dict.new

    assert t[:a] == nil
    Dict.put(t, :a, 2)
    assert t[:a] == 2
  end
end