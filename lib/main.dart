import 'package:flutter/material.dart';
import 'package:login/screen_card_vew.dart';
import 'package:login/ui/views/login_view.dart';
import 'helpers/ui_helpers.dart';
import 'helpers/screen_helper.dart';
import 'service_locator.dart';

void main() {
  // Register all the models and services before the app starts
  setupLocator();
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
