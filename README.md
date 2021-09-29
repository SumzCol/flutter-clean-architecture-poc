# Flutter Clean Architecture

## Architecture

![architecture diagram](data:image/png;base64,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)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Generating Code

To generate a mocking class using Mockito `@GenerateMocks` annotation you and to genereate dependency injection configurations can execute in your terminal

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

Bear in mind that the `watch` flag will be waiting and updating on the changes you make in your code. If you don't want this behaviour you can remove that flag.

## Testing

To test the application you can use the VSCode tool for Flutter or execute the VSCode command `Dart: Run all tests` after running `ctrl + shift + p`.

## Insights

- In some cases testing could be done with [mocktail](https://pub.dev/packages/mocktail) package since it is a wrapper of [mockito](https://pub.dev/packages/mockito) that works with Dart 2.0.^ and allows the usage of null safety features without breaking the testing code.
