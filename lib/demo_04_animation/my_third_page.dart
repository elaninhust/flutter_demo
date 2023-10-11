import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/demo_04_animation/my_forth_page.dart';

class MyThirdPage extends StatefulWidget {
  const MyThirdPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyThirdPage();
  }
}

class _MyThirdPage extends State<MyThirdPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('Third Page'),
      // ),
      child: Center(
        child: Hero(
          tag: 'avatar',
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return const MyForthPage();
              }));
            },
            onDoubleTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(
              'images/lake.jpg',
              width: 300,
            ),
          ),
        ),
      ),
    );
  }
}
