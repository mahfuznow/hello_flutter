import 'dart:io';

String featurePathName = ''; // example_feature
String featureVariableName =
    convertSnakeCaseToCamelCase(featurePathName); // exampleFeature
String featureClassName = featurePathName.capitalize(); // ExampleFeature

void main(List<String> arguments) {
  String? inputFeatureName = '';

  if (arguments.isEmpty) {
    print('Enter new feature name:');
    inputFeatureName = stdin.readLineSync();
    if (inputFeatureName == null || inputFeatureName.isEmpty) {
      print('Feature name cannot be empty.');
      return;
    }
  } else {
    inputFeatureName = arguments[0].trim();
  }

  featurePathName = convertToSnakeCase(inputFeatureName);
  featureVariableName = convertSnakeCaseToCamelCase(featurePathName);
  featureClassName = featureVariableName.capitalize();

  print('Feature path name: $featurePathName');
  print('Feature variable name: $featureVariableName');
  print('Feature class name: $featureClassName');

  //check if feature already exists
  final featurePath = Directory(featurePathName);
  if (featurePath.existsSync()) {
    print(
        'Feature "$featurePathName" already exists. try again with different name');
    return;
  }

  createFeatureStructure();
}

void createFeatureStructure() {
  final paths = [
    '$featurePathName/binding',
    '$featurePathName/route',
    '$featurePathName/screen',
  ];

  final files = {
    '$featurePathName/binding/${featurePathName}_binding.dart':
        bindingContent(),
    '$featurePathName/route/${featurePathName}_argument.dart':
        argumentContent(),
    '$featurePathName/route/${featurePathName}_route.dart': routeContent(),
    '$featurePathName/screen/${featurePathName}_mobile_portrait.dart':
        mobilePortraitContent(),
    '$featurePathName/screen/${featurePathName}_mobile_landscape.dart':
        mobileLandscapeContent(),
    '$featurePathName/${featurePathName}_adaptive_ui.dart': adaptiveUiContent(),
    '$featurePathName/${featurePathName}_view_model.dart': viewModelContent(),
  };

  for (final path in paths) {
    Directory(path).createSync(recursive: true);
  }

  files.forEach((filePath, fileContent) {
    File(filePath).writeAsStringSync(fileContent);
  });

  print('Feature "$featurePathName" structure created successfully.');

  updateRoutePath();
}

String bindingContent() => '''
import 'package:hello_flutter/presentation/base/base_binding.dart';

class ${featureClassName}Binding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // ${featureClassName}Repository ${featureVariableName}Repository = await diModule.resolve<${featureClassName}Repository>();
    // return diModule.registerInstance(
    //   ${featureClassName}ViewModel(movieRepository: movieRepository),
    // );
  }

  @override
  Future<void> removeDependencies() async {
    // return diModule.unregister<${featureClassName}ViewModel>();
  }
}
''';

String argumentContent() => '''
import 'package:hello_flutter/presentation/base/base_argument.dart';

class ${featureClassName}Argument extends BaseArgument {}
''';

String routeContent() => '''
import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/base/base_route.dart';
import 'package:hello_flutter/presentation/navigation/route_path.dart';
import '../${featurePathName}_adaptive_ui.dart';
import '../route/${featurePathName}_argument.dart';

class ${featureClassName}Route extends BaseRoute<${featureClassName}Argument> {
  @override
  RoutePath routePath = RoutePath.$featureVariableName;

  ${featureClassName}Route({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(builder: (_) => const ${featureClassName}AdaptiveUi());
  }
}
''';

String mobilePortraitContent() => '''
import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/base/base_ui_state.dart';
import '../${featurePathName}_view_model.dart';

class ${featureClassName}MobilePortrait extends StatefulWidget {
  final ${featureClassName}ViewModel viewModel;

  const ${featureClassName}MobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => ${featureClassName}MobilePortraitState();
}

class ${featureClassName}MobilePortraitState extends BaseUiState<${featureClassName}MobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: valueListenableBuilder(
        listenable: widget.viewModel.message,
        builder: (context, value) {
          return InkWell(
            child: Text('$featureClassName: \$value'),
            onTap: () => widget.viewModel.onClick(),
          );
        },
      ),
    );
  }
}
''';

String mobileLandscapeContent() => '''
import 'package:flutter/material.dart';
import '../screen/${featurePathName}_mobile_portrait.dart';

class ${featureClassName}MobileLandscape extends ${featureClassName}MobilePortrait {
  const ${featureClassName}MobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => ${featureClassName}MobileLandscapeState();
}

class ${featureClassName}MobileLandscapeState extends ${featureClassName}MobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: valueListenableBuilder(
        listenable: widget.viewModel.message,
        builder: (context, value) {
          return InkWell(
            child: Text('$featureClassName: \$value'),
            onTap: () => widget.viewModel.onClick(),
          );
        },
      ),
    );
  }
}
''';

String adaptiveUiContent() => '''
import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/base/base_adaptive_ui.dart';
import './binding/${featurePathName}_binding.dart';
import './${featurePathName}_view_model.dart';
import './route/${featurePathName}_argument.dart';
import './route/${featurePathName}_route.dart';
import './screen/${featurePathName}_mobile_landscape.dart';
import './screen/${featurePathName}_mobile_portrait.dart';

class ${featureClassName}AdaptiveUi extends BaseAdaptiveUi<${featureClassName}Argument, ${featureClassName}Route> {
  const ${featureClassName}AdaptiveUi({super.key});

  @override
  State<StatefulWidget> createState() => ${featureClassName}AdaptiveUiState();
}

class ${featureClassName}AdaptiveUiState extends BaseAdaptiveUiState<${featureClassName}Argument, ${featureClassName}Route, ${featureClassName}AdaptiveUi, ${featureClassName}ViewModel, ${featureClassName}Binding> {
  @override
  ${featureClassName}Binding binding = ${featureClassName}Binding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return ${featureClassName}MobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return ${featureClassName}MobileLandscape(viewModel: viewModel);
  }
}
''';

String viewModelContent() => '''
import 'package:flutter/foundation.dart';
import 'package:hello_flutter/presentation/base/base_viewmodel.dart';
import './route/${featurePathName}_argument.dart';

class ${featureClassName}ViewModel extends BaseViewModel<${featureClassName}Argument> {

  final ValueNotifier<String> _message = ValueNotifier('$featureClassName');

  ValueListenable<String> get message => _message;
  
  int count = 0;

  ${featureClassName}ViewModel();

  @override
  void onViewReady({${featureClassName}Argument? argument}) {
    super.onViewReady();
  }
  
  void onClick() {
     count++;
    _message.value = '\${message.value}\$count';
  }
    
}
''';

void updateRoutePath() {
  final enumFilePath = File('../navigation/route_path.dart');

  if (!enumFilePath.existsSync()) {
    print('RoutePath enum file not found.');
    return;
  }

  // Read the existing enum file content
  String enumContent = enumFilePath.readAsStringSync();

  // Add necessary imports for new feature after the last import statement
  final newImports = '''
import 'package:hello_flutter/presentation/feature/$featurePathName/route/${featurePathName}_argument.dart';
import 'package:hello_flutter/presentation/feature/$featurePathName/route/${featurePathName}_route.dart';
''';

  enumContent = newImports + enumContent;

  // 1. Replace the semicolon at the end of the last enum entry with a comma and add the new enum entry
  enumContent = enumContent.replaceFirst(
      RegExp(r'(\s*unknown;)'), '\n  $featureVariableName, \n  unknown;');

  // 2. Insert new cases for fromString, toPathString, and getAppRoute methods
  // Insert the new case for fromString method
  enumContent = enumContent.replaceFirstMapped(
      RegExp(r'(default:\s+return RoutePath\.unknown;)'),
      (match) =>
          "case '/$featureVariableName':\n        return RoutePath.$featureVariableName;\n      ${match.group(0)}");

  // Insert the new case for toPathString method
  enumContent = enumContent.replaceFirstMapped(
      RegExp(r"(default:\s+return '';)", multiLine: true),
      (match) =>
          "case RoutePath.$featureVariableName:\n        return '/$featureVariableName';\n      ${match.group(0)}");

  // Insert the new case for getAppRoute method
  enumContent = enumContent.replaceFirstMapped(
      RegExp(r'(default:\s+return UnknownRoute\(arguments: arguments\);)'),
      (match) =>
          "case RoutePath.$featureVariableName:\n        if (arguments is! ${featureClassName}Argument) {\n          throw Exception('${featureClassName}Argument is required');\n        }\n        return ${featureClassName}Route(arguments: arguments);\n      ${match.group(0)}");

  // Write the updated content back to the file
  try {
    enumFilePath.writeAsStringSync(enumContent);
    print('RoutePath updated successfully with new feature');
  } catch (e) {
    print('Failed to update RoutePath: $e');
  }
}

String convertToSnakeCase(String text) {
  return text.replaceAll(RegExp(r'\s+'), '_').toLowerCase();
}

String convertSnakeCaseToCamelCase(String snakeCase) {
  return snakeCase
      .split('_')
      .asMap()
      .map((index, word) {
        if (index == 0) {
          return MapEntry(index, word);
        } else {
          return MapEntry(index, word[0].toUpperCase() + word.substring(1));
        }
      })
      .values
      .join('');
}

extension StringExtension on String {
  String capitalize() {
    if (this == null) {
      throw ArgumentError("string: $this");
    }
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}
