import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CustomScrollViewExample());

class CustomScrollViewExample extends StatefulWidget {
  const CustomScrollViewExample({super.key});

  @override
  State<CustomScrollViewExample> createState() =>
      _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  @override
  Widget build(BuildContext context) {
    var listView = SliverFixedExtentList(
      itemExtent: 56,
      delegate: SliverChildBuilderDelegate(
        (context, index) => Text('$index'),
        childCount: 50,
      ),
    );
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            listView,
            listView,
          ],
        ),
      ),
    );
  }
}
