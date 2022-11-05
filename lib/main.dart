import 'package:flutter/material.dart';
import 'package:hook_example/new_home.dart';
import 'package:hook_example/text_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hooks w/ Dall E',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      routes: {
        textInput : textInputRoute,
        dallEHome : dallEHomeRoute,
      },
      initialRoute: textInput,
    );
  }
}
