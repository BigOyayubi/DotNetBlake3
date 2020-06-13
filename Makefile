NAME := DotNetBlake3
REVISION := $(shell git rev-parse --short HEAD)
OS := $(shell uname)

clean:
	dotnet clean
	cargo clean

linux: so app
    # to execute, .so shuld be in same dir with .exe
	cp -ap target/release/libdot_net_blake3.so ConsoleApp/bin/Release/netcoreapp3.1/

so: src/lib.rs
	cargo build --release

app: ConsoleApp/Program.cs Lib/Binding.cs
	dotnet build ConsoleApp

.PHONY: clean linux
