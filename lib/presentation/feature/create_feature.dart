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
            child: Text('Dashboard: \$value'),
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
            child: Text('Dashboard: \$value'),
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
