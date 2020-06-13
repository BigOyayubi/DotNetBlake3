# DotNetBlake3

.NETCore Blake3 implementation

BLAKE3 is crasy fast cryptographics hash function.

see https://github.com/BLAKE3-team/BLAKE3

if you want to use BLAKE3 on Unity. see https://github.com/BigOyayubi/BLAKE3Unity

# How To Use

```
# build .dll and .so on Linux
$ make linux

# copy .so and .dll in plugins/ into your project.
$ cp plugins/linux/x86_64/Lib.doo /your/proj/dir
$ cp plugins/linux/x86_64/libdot_net_blake3.so /your/proj/dir

# build and run sample console app
$ make linux_test
```

# Project Hierarchy

```
ConsoleApp/       # [C# csproj] test app to call BLAKE3 binding apis of Lib.dll
Lib/              # [C# csproj] BLAKE3 binding dll for dynamic link
LibStatic/        # [C# csproj] BLAKE3 binding dll for static link
src/              # [Rust lib]  BLAKE3 publish file via FFI 
Cargo.toml        # Rust build setting
DotNetBlake3.sln  # [C# sln]
```

# TODO 

* macOS support
* Windows support
* Android support
* iOS support
* nuget support

