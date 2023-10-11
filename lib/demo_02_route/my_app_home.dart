import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './next_page.dart';

class MyAppHome extends StatefulWidget {
  const MyAppHome({super.key, required this.title, this.initValue = 0});

  final String title;

  final int initValue;

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.initValue;
    print('initState');
  }

  @override
  void didUpdateWidget(covariant MyAppHome oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  void _handleAdd() {
    setState(() {
      count++;
    });
  }

  void _handleClear() {
    setState(() {
      count = widget.initValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    Widget content = CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$count',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  TextButton(
                    onPressed: () async {
                      final hello = await Navigator.push<String?>(
                        context,
                        CupertinoPageRoute(
                          // fullscreenDialog: true,
                          builder: (context) {
                            return const NextPage();
                          },
                        ),
                        // MaterialPageRoute(
                        //   fullscreenDialog: true,
                        //   builder: (context) {
                        //     return const NextPage();
                        //   },
                        // ),
                      );
                      print('Next Page: $hello');
                    },
                    child: const Text('Next Page'),
                  ),
                  Image.asset(
                    'images/lake.jpg',
                    width: 300,
                    // frameBuilder:
                    //     (context, child, frame, wasSynchronouslyLoaded) =>
                    //         Container(
                    //   color: Colors.lightBlue.withOpacity(0.4),
                    //   width: 300,
                    //   height: 300,
                    // ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 40,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  _handleClear();
                  // print('${_globalKey.currentState}');
                  // print('${_globalKey.currentWidget}');
                },
                child: ClipOval(
                  child: Container(
                    color: Colors.lightGreen.withOpacity(0.5),
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 40,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  _handleAdd();
                },
                child: ClipOval(
                  child: Container(
                    color: Colors.lightBlue.withOpacity(0.5),
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.add,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return content;
  }
}
