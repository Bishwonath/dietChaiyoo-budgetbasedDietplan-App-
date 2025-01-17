import 'package:diet_chaiyoo/app/app.dart';
import 'package:diet_chaiyoo/app/di/di.dart';
import 'package:diet_chaiyoo/core/network/hive_service.dart';
import 'package:flutter/material.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  await initDependencies();
  runApp(const MyApp());
}
