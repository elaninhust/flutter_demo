import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './my_app_home.dart';

void main() => runApp(const MyApp());

final _globalKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "App",
      theme: const CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyAppHome(
        key: _globalKey,
        title: "My Flutter App",
        initValue: 20,
      ),
    );
    // return MaterialApp(
    //   title: "App",
    //   theme: ThemeData(
    //     primaryColor: Colors.blue,
    //   ),
    //   home: MyAppHome(
    //     key: _globalKey,
    //     title: "My Flutter App",
    //     initValue: 20,
    //   ),
    // );
  }
}
