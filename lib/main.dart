import 'package:diet_chaiyoo/app/app.dart';
import 'package:diet_chaiyoo/app/di/di.dart';
import 'package:diet_chaiyoo/core/network/hive_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive Database
  await HiveService.init();

  // Initialize Dependencies

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    App(),
  );
}
