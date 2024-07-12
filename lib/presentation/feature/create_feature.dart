import 'dart:io';

void main(List<String> arguments) {
  String? featureName = '';

  if (arguments.isEmpty) {
    print('Please provide a feature name:');
    featureName = stdin.readLineSync();
    if (featureName == null || featureName.isEmpty) {
      print('Feature name cannot be empty.');
      return;
    }
  } else {
    featureName = arguments[0];
  }
  //TODO: maintain toLowerCase and convert to snakeCase & camelcase and use appropriately
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
        bindingContent(featureName),
    '$featurePath/route/${featureName}_argument.dart':
        argumentContent(featureName),
    '$featurePath/route/${featureName}_route.dart': routeContent(featureName),
    '$featurePath/screen/${featureName}_mobile_portrait.dart':
        mobilePortraitContent(featureName),
    '$featurePath/screen/${featureName}_mobile_landscape.dart':
        mobileLandscapeContent(featureName),
    '$featurePath/${featureName}_adaptive_ui.dart':
        adaptiveUiContent(featureName),
    '$featurePath/${featureName}_view_model.dart':
        viewModelContent(featureName),
  };

  for (final path in paths) {
    Directory(path).createSync(recursive: true);
  }

  files.forEach((filePath, fileContent) {
    File(filePath).writeAsStringSync(fileContent);
  });

  print('Feature "$featureName" structure created successfully.');

  updateRoutePath(featureName);
}

String bindingContent(String featureName) => '''
import 'package:hello_flutter/presentation/base/base_binding.dart';

class ${featureName.capitalize()}Binding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // MovieRepository movieRepository = await diModule.resolve<MovieRepository>();
    // return diModule.registerInstance(
    //   ${featureName.capitalize()}ViewModel(movieRepository: movieRepository),
    // );
  }

  @override
  Future<void> removeDependencies() async {
    // return diModule.unregister<${featureName.capitalize()}ViewModel>();
  }
}
''';

String argumentContent(String featureName) => '''
import 'package:hello_flutter/presentation/base/base_argument.dart';

class ${featureName.capitalize()}Argument extends BaseArgument {}
''';

String routeContent(String featureName) => '''
import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/base/base_route.dart';
import 'package:hello_flutter/presentation/navigation/route_path.dart';
import '../${featureName}_adaptive_ui.dart';
import '../route/${featureName}_argument.dart';

class ${featureName.capitalize()}Route extends BaseRoute<${featureName.capitalize()}Argument> {
  @override
  RoutePath routePath = RoutePath.$featureName;

  ${featureName.capitalize()}Route({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(builder: (_) => const ${featureName.capitalize()}AdaptiveUi());
  }
}
''';

String mobilePortraitContent(String featureName) => '''
import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/base/base_ui_state.dart';
import '../${featureName}_view_model.dart';

class ${featureName.capitalize()}MobilePortrait extends StatefulWidget {
  final ${featureName.capitalize()}ViewModel viewModel;

  const ${featureName.capitalize()}MobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => ${featureName.capitalize()}MobilePortraitState();
}

class ${featureName.capitalize()}MobilePortraitState extends BaseUiState<${featureName.capitalize()}MobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: valueListenableBuilder(
        listenable: widget.viewModel.message,
        builder: (context, value) {
          return InkWell(
            child: Text('${featureName.capitalize()}: \$value'),
            onTap: () => widget.viewModel.onClick(),
          );
        },
      ),
    );
  }
}
''';

String mobileLandscapeContent(String featureName) => '''
import 'package:flutter/material.dart';
import '../screen/${featureName}_mobile_portrait.dart';

class ${featureName.capitalize()}MobileLandscape extends ${featureName.capitalize()}MobilePortrait {
  const ${featureName.capitalize()}MobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => ${featureName.capitalize()}MobileLandscapeState();
}

class ${featureName.capitalize()}MobileLandscapeState extends ${featureName.capitalize()}MobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: valueListenableBuilder(
        listenable: widget.viewModel.message,
        builder: (context, value) {
          return InkWell(
            child: Text('${featureName.capitalize()}: \$value'),
            onTap: () => widget.viewModel.onClick(),
          );
        },
      ),
    );
  }
}
''';

String adaptiveUiContent(String featureName) => '''
import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/base/base_adaptive_ui.dart';
import './binding/${featureName}_binding.dart';
import './${featureName}_view_model.dart';
import './route/${featureName}_argument.dart';
import './route/${featureName}_route.dart';
import './screen/${featureName}_mobile_landscape.dart';
import './screen/${featureName}_mobile_portrait.dart';

class ${featureName.capitalize()}AdaptiveUi extends BaseAdaptiveUi<${featureName.capitalize()}Argument, ${featureName.capitalize()}Route> {
  const ${featureName.capitalize()}AdaptiveUi({super.key});

  @override
  State<StatefulWidget> createState() => ${featureName.capitalize()}AdaptiveUiState();
}

class ${featureName.capitalize()}AdaptiveUiState extends BaseAdaptiveUiState<${featureName.capitalize()}Argument, ${featureName.capitalize()}Route, ${featureName.capitalize()}AdaptiveUi, ${featureName.capitalize()}ViewModel, ${featureName.capitalize()}Binding> {
  @override
  ${featureName.capitalize()}Binding binding = ${featureName.capitalize()}Binding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return ${featureName.capitalize()}MobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return ${featureName.capitalize()}MobileLandscape(viewModel: viewModel);
  }
}
''';

String viewModelContent(String featureName) => '''
import 'package:flutter/foundation.dart';
import 'package:hello_flutter/presentation/base/base_viewmodel.dart';
import './route/${featureName}_argument.dart';
import './route/${featureName}_argument.dart';
import './route/${featureName}_route.dart';

class ${featureName.capitalize()}ViewModel extends BaseViewModel<${featureName.capitalize()}Argument> {

  final ValueNotifier<String> _message = ValueNotifier('$featureName');

  ValueListenable<String> get message => _message;
  
  int count = 0;

  ${featureName.capitalize()}ViewModel();

  @override
  void onViewReady({${featureName.capitalize()}Argument? argument}) {
    super.onViewReady();
  }
  
  void onClick() {
     count++;
    _message.value = '\${message.value}\$count';
  }
    
}
''';

void updateRoutePath(String featureName) {
  final enumFilePath = File('../navigation/route_path.dart');

  if (!enumFilePath.existsSync()) {
    print('RoutePath enum file not found.');
    return;
  }

  // Read the existing enum file content
  String enumContent = enumFilePath.readAsStringSync();

  // Add necessary imports for new feature after the last import statement
  final newImports = '''
import 'package:hello_flutter/presentation/feature/$featureName/route/${featureName}_argument.dart';
import 'package:hello_flutter/presentation/feature/$featureName/route/${featureName}_route.dart';
''';

  enumContent = newImports + enumContent;

  // 1. Replace the semicolon at the end of the last enum entry with a comma and add the new enum entry
  enumContent = enumContent.replaceFirst(
      RegExp(r'(\s*unknown;)'), '\n  $featureName, \n  unknown;');

  // 2. Insert new cases for fromString, toPathString, and getAppRoute methods
  // Insert the new case for fromString method
  enumContent = enumContent.replaceFirstMapped(
      RegExp(r'(default:\s+return RoutePath\.unknown;)'),
      (match) =>
          "case '/$featureName':\n        return RoutePath.$featureName;\n      ${match.group(0)}");

  // Insert the new case for toPathString method
  enumContent = enumContent.replaceFirstMapped(
      RegExp(r"(default:\s+return '';)", multiLine: true),
      (match) =>
          "case RoutePath.$featureName:\n        return '/$featureName';\n      ${match.group(0)}");

  // Insert the new case for getAppRoute method
  enumContent = enumContent.replaceFirstMapped(
      RegExp(r'(default:\s+return UnknownRoute\(arguments: arguments\);)'),
      (match) =>
          "case RoutePath.$featureName:\n        if (arguments is! ${featureName.capitalize()}Argument) {\n          throw Exception('${featureName.capitalize()}Argument is required');\n        }\n        return ${featureName.capitalize()}Route(arguments: arguments);\n      ${match.group(0)}");

  // Write the updated content back to the file
  try {
    enumFilePath.writeAsStringSync(enumContent);
    print('RoutePath updated successfully with new feature: $featureName');
  } catch (e) {
    print('Failed to update RoutePath: $e');
  }
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
