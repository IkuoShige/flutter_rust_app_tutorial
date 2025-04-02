.PHONY: all clean bridge build release debug

# Default target builds everything
all: bridge debug

# Generate the Flutter-Rust bridge code
bridge:
	flutter_rust_bridge_codegen generate

# Build the Flutter application (includes Rust compilation)
build: bridge
	flutter build linux

# Build in release mode
release: bridge
	flutter build linux --release

# Build in debug mode
debug: bridge
	flutter run -d linux

# Clean everything
clean:
	flutter clean
	cd rust && cargo clean
