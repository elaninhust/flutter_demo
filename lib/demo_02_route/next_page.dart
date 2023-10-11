import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  int? _previewTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_previewTime == null) {
          _previewTime = DateTime.now().millisecondsSinceEpoch;
          return Future<bool>.value(false);
        } else {
          final currentTime = DateTime.now().millisecondsSinceEpoch;

          final diff = currentTime - _previewTime!;

          _previewTime = currentTime;

          print(diff.toString());

          if (diff > 300) {
            return Future<bool>.value(false);
          } else {
            return Future<bool>.value(true);
          }
        }
      },
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Next Page'),
        ),
        child: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop('hello from the next page');
              },
              child: const Text('Go Back'),
            ),
          ),
        ),
      ),
    );
  }
}
