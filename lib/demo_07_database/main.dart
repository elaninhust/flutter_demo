import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/demo_07_database/first_page.dart';

// import 'package:flutter_demo/demo_07_database/db/db.dart' as db;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
