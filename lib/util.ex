defmodule ISO.Util do
  @doc """
  Removes accents/ligatures from letters.

      iex> Util.unaccent("Curaçao")
      "Curacao"
      iex> Util.unaccent("Republic of Foo (the)")
      "Republic of Foo (the)"
      iex> Util.unaccent("Åland Islands")
      "Aland Islands"
  """
  @spec unaccent(String.t()) :: String.t()
  def unaccent(string) do
    diacritics = Regex.compile!("[\u0300-\u036f]")

    string
    |> String.normalize(:nfd)
    |> String.replace(diacritics, "")
  end
end
