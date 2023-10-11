import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './first_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}
