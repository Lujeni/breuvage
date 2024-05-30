defmodule Username do
  def sanitize(username) when username == [], do: []

  def sanitize(username) do
    hd(username) |>
      case do
        c when c in ?a..?z -> [c]
        c when c == ?_ -> [c]
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        _ -> []
      end |> Kernel.++(sanitize(tl(username)))
    end
end
