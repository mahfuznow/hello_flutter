# Flutter Boilerplate

A starter template for Flutter projects designed to streamline the development process and ensure a
scalable, maintainable codebase.

## Features

- **Dynamic Layouts**: Adjusts based on device type (Mobile/Tablet) and orientation (
  Portrait/Landscape).
- **MVVM Architecture**: Preconfigured with a base setup for scalable code structure.
- **State Management**: Utilizes `ValueNotifier` for efficient and simple state management.
- **Base classes**: Utilized Base classes for reduce developer effort for common functionalities.
- **Network Calls**: Integrated with the `http` package for making network requests.
- **Navigation**: Employs Navigator 2.0 with support for passing arguments between screens.
- **Localizations**: Built-in support for multiple languages.
- **Material Theme**: Customizable dark and light themes.
- **Environment Configuration**: Managed using `DotEnv` for different environments.
- **Build Flavors**: Supports multiple build flavors including Dev, Test, Staging, and Prod.
- **Dependency Injection**: Created our own Dependency container so that it doesn't depends on third
  party library.
- **Modular approach**: Data, Domain layer is separated by making them individual flutter package
- **Code Generation**: When we need to add a new feature we can run script to generate all the
  necessary code to start with following our architecture.

## TODO

- **Local Database setup**: Local SQL database setup & integration
- **Dummy/Mock Data**: Mocking API response
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
   See [Environment setup guide](env/README.md) for more information.

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
cd lib/presentation/feature
dart create_feature.dart feature_name
```

## Change App Name and Application ID
### Android
Open app/build.gradle file and change the applicationId to your desired app name.
```bash
    productFlavors {
        flavor_dev {
            dimension "env"
            applicationId "com.mahfuznow.kirin_health_dev"
            resValue "string", "app_name", "KIRIN Health Dev"
        }
        flavor_test {
            dimension "env"
            applicationId "com.mahfuznow.kirin_health_test"
            resValue "string", "app_name", "KIRIN Healt Test"
        }
        flavor_staging {
            dimension "env"
            applicationId "com.mahfuznow.kirin_health_staging"
            resValue "string", "app_name", "KIRIN Health Staging"
        }
        flavor_prod {
            dimension "env"
            applicationId "com.mahfuznow.kirin_health"
            resValue "string", "app_name", "KIRIN Health"
        }
    }
```
### iOS
- open `ios/Flutter/flavor_devDebug.xcconfig` and change the `BUNDLE_NAME` and `BUNDLE_DISPLAY_NAME` to your desired app name.
- open `ios/Flutter/flavor_testDebug.xcconfig` and change the `BUNDLE_NAME` and `BUNDLE_DISPLAY_NAME` to your desired app name.
- open `ios/Flutter/flavor_stagingDebug.xcconfig` and change the `BUNDLE_NAME` and `BUNDLE_DISPLAY_NAME` to your desired app name.
- open `ios/Flutter/flavor_prodDebug.xcconfig` and change the `BUNDLE_NAME` and `BUNDLE_DISPLAY_NAME` to your desired app name.
- open `ios/Flutter/flavor_devRelease.xcconfig` and change the `BUNDLE_NAME` and `BUNDLE_DISPLAY_NAME` to your desired app name.
- open `ios/Flutter/flavor_testRelease.xcconfig` and change the `BUNDLE_NAME` and `BUNDLE_DISPLAY_NAME` to your desired app name.
- open `ios/Flutter/flavor_stagingRelease.xcconfig` and change the `BUNDLE_NAME` and `BUNDLE_DISPLAY_NAME` to your desired app name.
- open `ios/Flutter/flavor_prodRelease.xcconfig` and change the `BUNDLE_NAME` and `BUNDLE_DISPLAY_NAME` to your desired app name.

To change the bundle identifier, open the `ios/Runner.xcodeproj` file in Xcode and update manually using Xcode UI for each build type.

## Change App Icon
### Android
- Replace the `android/app/src/flavor_dev/res` folder with your desired icon for Dev app.
- Replace the `android/app/src/flavor_test/res` folder with your desired icon for Test app.
- Replace the `android/app/src/flavor_staging/res` folder with your desired icon for Staging app.
- Replace the `android/app/src/main/res` folder with your desired icon for Prod app.

### iOS
- Replace the `ios/Runner/Assets.xcassets/flavor_devAppIcon.appiconset` folder with your desired icon for Dev app.
- Replace the `ios/Runner/Assets.xcassets/flavor_testAppIcon.appiconset` folder with your desired icon for Test app.
- Replace the `ios/Runner/Assets.xcassets/flavor_stagingAppIcon.appiconset` folder with your desired icon for Staging app.
- Replace the `ios/Runner/Assets.xcassets/AppIcon.appiconset` folder with your desired icon for Prod app.

### Flutter App Best Practices

See [Flutter App Best Practices](doc/best_practices.md) for more information on general best
practices for any Flutter app.
app.

### Flutter App Security Measures

See [Flutter App Security Measures](doc/security.md) for more information on securing your Flutter
app.

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
