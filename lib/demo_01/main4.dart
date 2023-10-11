import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const GridScrollExample());

class GridScrollExample extends StatefulWidget {
  const GridScrollExample({super.key});

  @override
  State<GridScrollExample> createState() => _GridScrollExampleState();
}

class _GridScrollExampleState extends State<GridScrollExample> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Stack(
          children: [
            Scrollbar(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                children: [
                  Container(
                    color: Colors.lightBlue.withOpacity(0.4),
                    child: const Icon(Icons.ac_unit),
                  ),
                  Container(
                    color: Colors.lightGreen.withOpacity(0.4),
                    child: const Icon(Icons.ac_unit),
                  ),
                  Container(
                    color: Colors.redAccent.withOpacity(0.4),
                    child: const Icon(Icons.ac_unit),
                  ),
                  Container(
                    color: Colors.lightBlue.withOpacity(0.4),
                    child: const Icon(Icons.ac_unit),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
