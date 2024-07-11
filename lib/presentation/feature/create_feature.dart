import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Please provide a feature name.');
    return;
  }

  final featureName = arguments[0];
  createFeatureStructure(featureName);
}

void createFeatureStructure(String featureName) {
  final featurePath = featureName;

  final paths = [
    '$featurePath/binding',
    '$featurePath/route',
    '$featurePath/screen',
  ];

  final files = {
    '$featurePath/binding/${featureName}_binding.dart':
        bindingTemplate(featureName),
    '$featurePath/route/${featureName}_argument.dart':
        argumentTemplate(featureName),
    '$featurePath/route/${featureName}_route.dart': routeTemplate(featureName),
    '$featurePath/screen/${featureName}_mobile_portrait.dart':
        mobilePortraitTemplate(featureName),
    '$featurePath/screen/${featureName}_mobile_landscape.dart':
        mobileLandscapeTemplate(featureName),
    '$featurePath/${featureName}_adaptive_ui.dart':
        adaptiveUiTemplate(featureName),
    '$featurePath/${featureName}_view_model.dart':
        viewModelTemplate(featureName),
  };

  for (final path in paths) {
    Directory(path).createSync(recursive: true);
  }

  for (final file in files.entries) {
    File(file.key).writeAsStringSync(file.value);
  }

  print('Feature "$featureName" structure created successfully.');
}

String bindingTemplate(String featureName) => '''
class ${featureName.capitalize()}Binding {
  // TODO: Add binding code here
}
''';

String argumentTemplate(String featureName) => '''
class ${featureName.capitalize()}Argument {
  // TODO: Add argument code here
}
''';

String routeTemplate(String featureName) => '''
class ${featureName.capitalize()}Route {
  // TODO: Add route code here
}
''';

String mobilePortraitTemplate(String featureName) => '''
class ${featureName.capitalize()}MobilePortrait {
  // TODO: Add mobile portrait code here
}
''';

String mobileLandscapeTemplate(String featureName) => '''
class ${featureName.capitalize()}MobileLandscape {
  // TODO: Add mobile landscape code here
}
''';

String adaptiveUiTemplate(String featureName) => '''
class ${featureName.capitalize()}AdaptiveUI {
  // TODO: Add adaptive UI code here
}
''';

String viewModelTemplate(String featureName) => '''
class ${featureName.capitalize()}ViewModel {
  // TODO: Add view model code here
}
''';

extension StringExtension on String {
  String capitalize() {
    if (this == null) {
      throw ArgumentError("string: $this");
    }
    if (this.isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + this.substring(1);
  }
}
