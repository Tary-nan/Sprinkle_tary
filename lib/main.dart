import 'package:flutter/material.dart';
import 'package:sprinkle_architecture_tary/Manager/ExampleManager.dart';
import 'package:sprinkle_architecture_tary/Overseer.dart';
import 'package:sprinkle_architecture_tary/Provider/Provider.dart';
import 'package:sprinkle_architecture_tary/Screen/displayScreen.dart';

void main() => runApp(MyApp());

extension MyExtension on BuildContext{
  T fetch<T> () => Provider.of(this).fetch<T>();
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer({
        ExampleManager :()=> ExampleManager(),
      }),
      child: MaterialApp(
        home: Scaffold(
          body: DirectPageExemple(),
        ),
      ),
    );
  }
}
