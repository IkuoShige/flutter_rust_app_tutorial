# my_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# How to create new flutter project feat Rust.

```
cargo install flutter_rust_bridge_codegen
```

flutter_rust_bridge_codegen create で flutter + rust の雛形を作成する例

```
flutter_rust_bridge_codegen create my_app && cd my_app && flutter run -d linux
```

rustのコードを変更した場合, 以下のコマンドで共有ライブラリを更新する必要がある.

```
flutter_rust_bridge_codegen generate
```
