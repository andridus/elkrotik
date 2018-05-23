defmodule Elkrotik.Command do
  def c(list) do
    b = GenServer.call(Elkrotik.Core, {:command, list}, :infinity)
        |> Enum.map(&reconize/1)
        |> Enum.concat
    case b do
      [%{}] ->
        IO.puts("\n TRYE:#{inspect b}")
        [b1] = b
        case Map.has_key?(b1, :message) do
          nil -> c(list)
          _  -> b1
        end

      _ ->
        IO.puts("\n RESP:#{inspect b}")
        b
    end


  end
  defp reconize(i) do
    r = Enum.map(i, &broken_parts/1)
        |> Enum.concat
        |> Map.new
    [r]
  end

  defp broken_parts(p) do
    bp = Regex.split(~r/=/, List.to_string(p))
    case Enum.at(bp, 1) do
      nil -> []
      ".id" ->
        [{:id, Enum.at(bp, 2)}]
      a ->
        atom = String.to_atom(a)
        [{atom, Enum.at(bp, 2)}]
    end

  end
end
