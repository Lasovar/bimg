project "bimg"
   kind "StaticLib"
   language "C++"
   targetdir ("bin/" .. outputdir .. "/%{prj.name}")
   objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
   files {
      "src/**.cpp",
      "include/**.h",
      "3rdparty/astc-encoder/source/*.cpp",
      "3rdparty/astc-codec/src/*.cc",
   }
   removefiles {
        "src/image_decode.cpp",  -- bgfx already includes this internally
        "src/image_encode.cpp",
   }
   includedirs {
      "include",
      "../bx/include",
      "3rdparty",
      "3rdparty/astc-encoder/include",
      "3rdparty/astc-codec/include",
      "3rdparty/tinyexr/deps/miniz",
      "3rdparty/iqa/include"
   }
   links { "bx" }
