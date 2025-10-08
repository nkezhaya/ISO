defmodule ISOTest do
  use ExUnit.Case
  doctest ISO

  describe "subdivision_code/2" do
    test "returns a subdivion code for the country and state" do
      assert ISO.subdivision_code("MX", "Veracruz") == "MX-VER"
      assert ISO.subdivision_code("MX", "YucatAN") == "MX-YUC"
      assert ISO.subdivision_code("IE", "Co. Wicklow") == "IE-WW"
      assert ISO.subdivision_code("IE", "Wicklow") == "IE-WW"
      assert ISO.subdivision_code("US", "West Virginia") == "US-WV"
      assert ISO.subdivision_code("US", "Virginia") == "US-VA"
      assert is_nil(ISO.subdivision_code("CA", "US-TX"))
      assert is_nil(ISO.subdivision_code("MX", "Not a subdivision."))
    end
  end

  describe "unaccent/1" do
    test "removes diacritics" do
      assert ISO.normalize("Curaçao") == "Curacao"
      assert ISO.normalize("Republic of Foo (the)") == "Republic of Foo (the)"
      assert ISO.normalize("Åland Islands") == "Aland Islands"
    end
  end
end
