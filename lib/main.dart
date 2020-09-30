import 'package:flutter/material.dart';

import 'features/presentation/views/login_view.dart';
import 'service_locator.dart' as di;

void main() async {
  // Register all the models and services before the app starts
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: LoginViewView(),
    );
  }
}
