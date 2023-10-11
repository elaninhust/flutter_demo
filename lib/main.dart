import 'package:flutter/material.dart';

import 'demo_01/titleSection.dart';
import 'demo_01/buttonSection.dart';
import 'demo_01/textSection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              rRow('90000000000012345'),
              FittedBox(
                child: rRow('90000000000012345'),
              ),
              rRow('800'),
              FittedBox(
                child: rRow('800'),
              ),
              LayoutBuilder(
                builder: (context, constrains) => FittedBox(
                  child: ConstrainedBox(
                    constraints: constrains.copyWith(
                      minWidth: constrains.maxWidth,
                      maxWidth: double.infinity,
                    ),
                    child: rRow('800'),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: LayoutBuilder(builder: (_, constrains) {
                  print('width: ${constrains.minWidth}-${constrains.maxWidth}');
                  print(
                      'height: ${constrains.minHeight}-${constrains.maxHeight}');
                  return const ColoredBox(
                    color: Colors.lightGreen,
                    child: Center(
                      widthFactor: 2,
                      heightFactor: 2,
                      child: ParentWidget(),
                    ),
                  );
                }),
              ),
            ]
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: e,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

Widget rRow(String string) {
  Widget text = Text(
    string,
    style: const TextStyle(
      color: Colors.red,
      fontSize: 25,
    ),
  );
  return ColoredBox(
    color: Colors.grey,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [text, text, text],
    ),
  );
}

/// 有状态 widget
class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool showRed = false;

  void _handleTap() {
    setState(() {
      showRed = !showRed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          width: 100,
          height: 100,
          color: showRed ? Colors.yellow : Colors.red,
        ),
      ),
    );
  }
}

/// 无状态 widget
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}
