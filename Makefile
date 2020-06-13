NAME := DotNetBlake3
REVISION := $(shell git rev-parse --short HEAD)
OS := $(shell uname)

clean:
	dotnet clean -c Release
	cargo clean
	rm -rf plugins

linux_test: blake3 binding
	dotnet build ConsoleApp -c Release
    # to execute, .so shuld be in same dir with .exe
	cp -ap target/release/libdot_net_blake3.so ConsoleApp/bin/Release/netcoreapp3.1/
	# exec test app
	./ConsoleApp/bin/Release/netcoreapp3.1/ConsoleApp

linux: blake3 binding
	# publish
	mkdir -p plugins/linux/x86_64
	cp target/release/libdot_net_blake3.so plugins/linux/x86_64/
	cp Lib/bin/Release/netstandard2.0/Lib.dll plugins/linux/x86_64/
	
blake3: src/lib.rs
	cargo build --release

binding: Lib/Binding.cs
	dotnet build Lib -c Release
	dotnet build LibStatic -c Release

.PHONY: clean
