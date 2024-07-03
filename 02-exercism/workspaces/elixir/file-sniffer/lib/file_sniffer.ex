#Instructions
#
#You have been working on a project which allows users to upload files to the server to be shared with other users. You have been tasked with writing a function to verify that an upload matches its media type. You do some research and discover that the first few bytes of a file are generally unique to that file type, giving it a sort of signature.
#
#Use the following table for reference:
#File type 	Common extension 	Media type 	binary 'signature'
#ELF 	"exe" 	"application/octet-stream" 	0x7F, 0x45, 0x4C, 0x46
#BMP 	"bmp" 	"image/bmp" 	0x42, 0x4D
#PNG 	"png" 	"image/png" 	0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A
#JPG 	"jpg" 	"image/jpg" 	0xFF, 0xD8, 0xFF
#GIF 	"gif" 	"image/gif" 	0x47, 0x49, 0x46
#1. Given an extension, return the expected media type
#
#
#FileSniffer.type_from_extension("exe")
## => "application/octet-stream"
#
#FileSniffer.type_from_extension("txt")
## => nil

#2. Given a binary file, return the expected media type
#
#Implement the type_from_binary/1 function. It should take a file (binary) and return the media type (string) or nil if the extension does not match with the expected ones.
#
#file = File.read!("application.exe")
#FileSniffer.type_from_binary(file)
## => "application/octet-stream"
#
#file = File.read!("example.txt")
#FileSniffer.type_from_binary(file)
# => nil
# Don't worry about reading the file as a binary. Assume that has been done for you and is provided by the tests as an argument
#
defmodule FileSniffer do
  @type_map %{
    "exe" => "application/octet-stream",
    "bmp" => "image/bmp",
    "png" => "image/png",
    "jpg" => "image/jpg",
    "gif" => "image/gif"
  }

  def type_from_extension(extension) do
    Map.get(@type_map, extension, nil)
  end

  def type_from_binary(file_binary) do
    case file_binary do
      <<0x7F, 0x45, 0x4C, 0x46, _::binary>> -> "application/octet-stream"
      <<0x42, 0x4D, _::binary>> -> "image/bmp"
      <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>> -> "image/png"
      <<0xFF, 0xD8, 0xFF, _::binary>> -> "image/jpg"
      <<0x47, 0x49, 0x46, _::binary>> -> "image/gif"
      _ -> nil
    end
  end

  def verify(file_binary, extension) do
    if (type = type_from_binary(file_binary)) == type_from_extension(extension) && !!type do
      {:ok, type}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
