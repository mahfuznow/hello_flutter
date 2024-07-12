# Flutter Boilerplate

A starter template for Flutter projects designed to streamline the development process and ensure a
scalable, maintainable codebase.

## Features

- **Dynamic Layouts**: Adjusts based on device type (Mobile/Tablet) and orientation (
  Portrait/Landscape).
- **MVVM Architecture**: Preconfigured with a base setup for scalable code structure.
- **State Management**: Utilizes `ValueNotifier` for efficient and simple state management.
- **Network Calls**: Integrated with the `http` package for making network requests.
- **Navigation**: Employs Navigator 2.0 with support for passing arguments between screens.
- **Localizations**: Built-in support for multiple languages.
- **Material Theme**: Customizable dark and light themes.
- **Environment Configuration**: Managed using `DotEnv` for different environments.
- **Build Flavors**: Supports multiple build flavors including Dev, Test, Staging, and Prod.

## TODO

- **Dependency Injection**: Integrate a DI framework.
- **Code Generation**: Add support for code generation tools.
- **Unit Testing**: Set up a comprehensive unit testing framework.
- **CI/CD**: Configure Continuous Integration and Continuous Deployment pipelines.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/flutter-boilerplate.git
   cd flutter-boilerplate
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**:
    - Create the following files in `lib/env` directory:
        1. `.env.dev`
        2. `.env.test`
        3. `.env.staging`
        4. `.env.prod`

    - These files should contain the environment variables for each environment. The files should be
      in the following format:
    ```text
    API_BASE_URL=''
    API_KEY=''
    ```

### Running the App

To run the app with a specific build flavor:

```bash
flutter run --flavor flavor_dev -t lib/main/main_flavor_dev.dart
flutter run --flavor flavor_test -t lib/main/main_flavor_test.dart
flutter run --flavor flavor_staging -t lib/main/main_flavor_staging.dart
flutter run --flavor flavor_prod -t lib/main/main_flavor_prod.dart
```

### Generate boilerplate code for new feature

Either you can use the `create_feature` run configuration to run the script then input the feature
name in the run console
orElse,

```bash
cd lib
dart create_feature.dart feature_name
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss your ideas.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or suggestions, feel free to reach out
to [mahfuzur.rahman@brainstation-23.com](mailto:mahfuzur.rahman@brainstation-23.com).

---

This boilerplate is intended to provide a strong foundation for Flutter applications. By adhering to
best practices and a structured architecture, it aims to help developers create robust and scalable
applications efficiently. Happy coding!
