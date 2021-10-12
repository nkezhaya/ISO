defmodule ISOTest do
  use ExUnit.Case
  doctest ISO

  test "subdivision code" do
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
