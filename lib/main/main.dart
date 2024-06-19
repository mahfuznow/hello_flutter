import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hello_flutter/main/flavors.dart';
import 'package:hello_flutter/presentation/app/app.dart';

void appMain({required AppFlavor appFlavor}) async {
  F.appFlavor = appFlavor;
  await F.loadEnvironment();

  const requiredEnvVars = ['API_BASE_URL', 'API_TOKEN'];

  bool hasEnv = dotenv.isEveryDefined(requiredEnvVars);

  if (!hasEnv) {
    throw Exception('Missing required environment variables: $requiredEnvVars');
  }

  debugPrint("*********************************************");
  debugPrint("API_BASE_URL:${dotenv.env['API_BASE_URL']}");
  debugPrint("*********************************************");

  runApp(MyApp());
}
