import 'package:domestore/Pages/shared/Cache/sheredPrafrences.dart';
import 'package:domestore/application.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheData.cacheInitialization();
  runApp(const MyApp());
}
