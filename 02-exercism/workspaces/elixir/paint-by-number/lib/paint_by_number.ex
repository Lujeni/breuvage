defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    :math.log2(color_count)
    |> Float.ceil()
    |> trunc()
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bits_per_pixel = :math.ceil(:math.log2(color_count)) |> trunc
    new_pixel = <<pixel_color_index::size(bits_per_pixel)>>
    <<new_pixel::bitstring, picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil
  def get_first_pixel(picture, color_count) do
    bits_per_pixel = :math.ceil(:math.log2(color_count)) |> trunc
    <<first_pixel::size(bits_per_pixel), _::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(picture, _) when byte_size(picture) == 0 do <<>> end
  def drop_first_pixel(picture, color_count) do
    bits_per_pixel = :math.ceil(:math.log2(color_count)) |> trunc
    <<_::size(bits_per_pixel), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
